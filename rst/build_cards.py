#!/usr/bin/env python

import os
import subprocess
import argparse
import shlex
import shutil

DPI = 300


def svg2svg(source_path, destination_path, layers):
    """
    Show a selection of inkscape layer in a SVG file.
    Other layers are hidden.

    :param str source_path:         SVG source file path
    :param str destination_path:    SVG destination file path
    :param list layers:             List of layers to show
    :return:
    """
    select_options = ' '.join(['-s {layername}'.format(layername=_layername) for _layername in layers])
    quoted_source_path = shlex.quote(source_path)
    quoted_destination_path = shlex.quote(destination_path)
    command = "./svg2svg.py {source_path} {select_options} -o {destination_path}".format(
        source_path=quoted_source_path,
        select_options=select_options,
        destination_path=quoted_destination_path)
    # execute command
    status = subprocess.call(shlex.split(command))
    if status != 0:
        exit(status)


def svg2png(svg_filepath, png_filepath, dpi):
    """
    Convert svg to png with inkscape.
    Delete svg file.

    :param str svg_filepath:    SVG file path
    :param str png_filepath:    PNG file path
    :param int dpi:             DotPerInch for resolution
    :return:
    """
    quoted_svg_filepath = shlex.quote(svg_filepath)
    quoted_png_filepath = shlex.quote(png_filepath)
    command = "inkscape -d {dpi} -z -f {svg_filepath} -e {png_filepath}".format(
        svg_filepath=quoted_svg_filepath,
        png_filepath=quoted_png_filepath,
        dpi=dpi)
    # execute command
    status = subprocess.call(shlex.split(command))
    if status != 0:
        exit(status)

    # remove temporary svg file
    if os.path.exists(svg_filepath):
        try:
            os.unlink(svg_filepath)
        except IOError:
            pass


def png_add_mask_and_drop_shadow(source_filepath, mask_filepath, destination_filepath, shadow_offset=10):
    """
    Resize source png at 205x280 (75dpi), then cut out with 75 dpi mask, then add drop shadow

    :param str source_filepath: Path to source png file
    :param str mask_filepath:   Path to mask png file
    :param str destination_filepath: Path to save result file
    :param int shadow_offset: Offset of shadow in pixels
    :return:
    """
    quoted_source_filepath = shlex.quote(source_filepath)
    quoted_mask_filepath = shlex.quote(mask_filepath)
    quoted_destination_filepath = shlex.quote(destination_filepath)

    command = "convert \( {source_filepath} -resize 205x280 {mask_filepath} -alpha Off -compose copyopacity -composite \) \
          -background black \( +clone -shadow 60x{offset}+{offset}+{offset} \) +swap \
          -compose Over -composite +repage \
          {destination_filepath}".format(
        source_filepath=quoted_source_filepath,
        mask_filepath=quoted_mask_filepath,
        destination_filepath=quoted_destination_filepath,
        offset=shadow_offset)

    # execute command
    status = subprocess.call(shlex.split(command))
    if status != 0:
        exit(status)


def png_assemble(sources, destination_path, offset, rotate=0):
    """
    Compose sources side by side horizontally on a transparent background

    :param list sources:    List of sources pathes
    :param str destination_path: Path of detsination file
    :param int offset:  Offset in pixels
    :param int rotate: Optional, default=0, rotate N degree
    :return:
    """
    command = "convert"
    quoted_destination_filepath = destination_path

    count = 0
    for png_filepath in sources:
        quoted_png_filepath = shlex.quote(png_filepath)

        command += " -page +{offset}+0 \( -rotate {rotate} {png_filepath} \)".format(
            offset=count*offset,
            png_filepath=quoted_png_filepath,
            rotate=rotate
        )

    command += " +append {destination_path}".format(destination_path=quoted_destination_filepath)

    # execute command
    status = subprocess.call(shlex.split(command))
    if status != 0:
        exit(status)

if __name__ == '__main__':
    # command line options parser
    parser = argparse.ArgumentParser(description='Build PNG card sets')
    parser.add_argument('source', action="store", help='Source directory path with SVG files')
    parser.add_argument('destination', action="store", help='Destination directory path to save PNG files')

    args = parser.parse_args()

    # check required svg files
    back_layers_path = os.path.join(args.source, 'back_layers.svg')
    front_layers_path = os.path.join(args.source, 'front_layers.svg')
    if not os.path.exists(back_layers_path):
        print('File {path} missing'.format(path=back_layers_path))
        exit(1)
    if not os.path.exists(front_layers_path):
        print('File {path} missing'.format(path=front_layers_path))
        exit(1)
    if not os.path.exists(args.destination) or not os.path.isdir(args.destination):
        print('Directory {path} missing'.format(path=args.destination))
        exit(1)

    destination_path = os.path.join(args.destination, os.path.basename(args.source))
    if not os.path.exists(destination_path):
        try:
            os.mkdir(destination_path)
        except IOError as e:
            print(str(e))
            exit(1)
        print("directory {dirname} created".format(dirname=destination_path))

    # For each level (card set)
    for level in range(1, 5):
        level_name = 'level_{level}'.format(level=level)
        # create set folder
        _dirname = os.path.join(destination_path, level_name)
        if not os.path.exists(_dirname):
            try:
                os.mkdir(_dirname)
            except IOError as e:
                print(str(e))
                exit(1)

            print("directory {dirname} created".format(dirname=_dirname))

        ####################################
        # BACK IMAGE
        ####################################
        # create back image of the set
        filename = 'back'
        svg_path = os.path.join(_dirname, filename + '.svg')
        layers = ['background_{level}'.format(level=level), level_name]
        back_png_path = os.path.join(_dirname, filename + '.png')

        # compose svg layers
        svg2svg(back_layers_path, svg_path, layers)

        # convert to png
        svg2png(svg_path, back_png_path, DPI)

        ############
        ## create web preview
        # Use mask image as alpha on card : convert back_2.png mask.png -alpha Off -compose CopyOpacity -composite test.png
        # convert -background transparent -page +0+0 \( back_2.png mask.png -alpha Off -compose copyopacity -composite \) -page +1000+0 \( back_1.png mask.png -alpha Off -compose copyopacity -composite \) +append test.png

        ################################################
        # create cutout mask image for web preview
        filename = 'mask'
        svg_path = os.path.join(_dirname, filename + '.svg')
        layers = ['mask']
        mask_png_path = os.path.join(destination_path, filename + '.png')
        preview_png_path = os.path.join(destination_path, 'back_{level}'.format(level=level) + '.png')

        # extract mask from svg layers
        svg2svg(back_layers_path, svg_path, layers)

        # convert mask to png in destination path
        svg2png(svg_path, mask_png_path, 75)

        # create a web preview card, cutted out with a drop shadow
        png_add_mask_and_drop_shadow(back_png_path, mask_png_path, preview_png_path)

        ####################################
        # FRONT IMAGES
        ####################################
        # create 13 value cards
        card_number = 1
        # for each value...
        for value in range(1, 14):

            value_name = 'value_{number}'.format(number=value)

            # create front image of the value
            filename = 'front_{number}'.format(number=card_number)
            svg_path = os.path.join(_dirname, filename + '.svg')
            layers = ['background_{level}'.format(level=level), level_name, value_name]

            # compose svg layers
            svg2svg(front_layers_path, svg_path, layers)

            # convert to png
            svg2png(svg_path, os.path.join(_dirname, filename + '.png'), DPI)

            card_number += 1

        ####################################
        # create marker cards from back_layers.svg
        filename = 'front_53'
        svg_path = os.path.join(_dirname, filename + '.svg')
        layers = ['background_{level}'.format(level=level), 'marker_{level}'.format(level=level)]

        # compose svg layers
        svg2svg(back_layers_path, svg_path, layers)

        # convert to png
        svg2png(svg_path, os.path.join(_dirname, filename + '.png'), DPI)

        ######################################
        # create a web preview card of a marker card, cutted out with a drop shadow
        front_png_path = os.path.join(_dirname, "front_53.png")
        preview_png_path = os.path.join(destination_path, "marker_{level}.png".format(level=level))

        png_add_mask_and_drop_shadow(front_png_path, mask_png_path, preview_png_path)

        #####################################
        # create notice card
        filename = 'front_54'
        svg_path = os.path.join(_dirname, filename + '.svg')
        layers = ['notice']

        # compose svg layers
        svg2svg(front_layers_path, svg_path, layers)

        # convert to png
        svg2png(svg_path, os.path.join(_dirname, filename + '.png'), DPI)

        ######################################
        # create a web preview card of a front card, cutted out with a drop shadow
        front_png_path = os.path.join(_dirname, "front_1.png")
        preview_png_path = os.path.join(destination_path, "front_{level}.png".format(level=level))

        png_add_mask_and_drop_shadow(front_png_path, mask_png_path, preview_png_path)

        #####################################
        # ZIP SET
        #####################################
        zip_filename = '{level}.zip'.format(level=level_name)

        # goto destination directory to zip folder
        current_dir = os.getcwd()
        os.chdir(destination_path)

        # zip folder command
        command = 'zip -qr {zip_filename} {source}'.format(zip_filename=zip_filename, source=level_name)

        # execute command
        status = subprocess.call(shlex.split(command))
        if status != 0:
            exit(status)

        # go back to project directory
        os.chdir(current_dir)

        # remove temporary folder
        if os.path.exists(_dirname):
            try:
                print("directory {dirname} deleted".format(dirname=_dirname))
                shutil.rmtree(_dirname)
            except IOError:
                pass

    ###################################
    # create preview of back cards
    png_assemble(
        [os.path.join(destination_path, "back_{level}.png".format(level=level)) for level in range(1, 5)],
        os.path.join(destination_path, "backs.png"),
        1000
    )

    ###################################
    # create preview of front cards
    png_assemble(
        [os.path.join(destination_path, "front_{level}.png".format(level=level)) for level in range(1, 5)],
        os.path.join(destination_path, "fronts.png"),
        1000
    )

    ###################################
    # create preview of marker cards
    png_assemble(
        [os.path.join(destination_path, "marker_{level}.png".format(level=level)) for level in range(1, 5)],
        os.path.join(destination_path, "markers.png"),
        1000,
        270
    )

    exit(0)
