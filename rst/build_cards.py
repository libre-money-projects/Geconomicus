#!/usr/bin/env python

import os
import subprocess
import argparse
import shlex
import shutil

PNG_DPI = 300


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
        layers = ['background', level_name]

        # compose svg layers
        svg2svg(back_layers_path, svg_path, layers)

        # convert to png
        svg2png(svg_path, os.path.join(_dirname, filename + '.png'), PNG_DPI)

        ####################################
        # FRONT IMAGES
        ####################################
        # create 13 front cards
        card_number = 1
        # for each value...
        for value in range(1, 14):

            value_name = 'value_{number}'.format(number=value)

            # create front image of the value
            filename = 'front_{number}'.format(number=card_number)
            svg_path = os.path.join(_dirname, filename + '.svg')
            layers = ['background', level_name, value_name]

            # compose svg layers
            svg2svg(front_layers_path, svg_path, layers)

            # convert to png
            svg2png(svg_path, os.path.join(_dirname, filename + '.png'), PNG_DPI)

            card_number += 1

        #####################################
        # ZIP SETS
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

    exit(0)
