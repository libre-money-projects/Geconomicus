#!/usr/bin/env python
from xml.dom import minidom
import argparse


def get_layers(filepath):
    """
    Return the list of inkscape layers in the file

    :param filepath: Path of the svg file
    :rtype: list
    """
    xmldoc = minidom.parse(filepath)

    assert isinstance(xmldoc, minidom.Document)

    _layers = []
    for node in xmldoc.getElementsByTagName('g'):
        if 'inkscape:groupmode' in node.attributes.keys() and node.attributes['inkscape:groupmode'].value == 'layer':
            _layers.append(node)

    return _layers


def select_layers(filepath, _layers):
    """
    Load filepath, hide all inkscape layers except those in layers parameter
    Return the modified svg file content

    :param str filepath:    Path of the SVG file
    :param list _layers:     List of the layers to select
    :return:
    :rtype str:
    """
    xmldoc = minidom.parse(filepath)

    assert isinstance(xmldoc, minidom.Document)

    # for all group nodes...
    for node in xmldoc.getElementsByTagName('g'):
        # if node is an inkscape layer...
        if 'inkscape:groupmode' in node.attributes.keys() and node.attributes['inkscape:groupmode'].value == 'layer':
            # capture style attribute
            _style = node.attributes['style'].value
            # if layer selected...
            if node.attributes['inkscape:label'].value in _layers:
                # show layer
                node.attributes['style'].value = _style.replace('display:none', 'display:inline')
            else:
                # hide layer
                node.attributes['style'].value = _style.replace('display:inline', 'display:none')

    return xmldoc.toxml()


def save_svg(svg, filepath):
    """
    Save svg content in filepath

    :param str  svg:        SVG content
    :param str  filepath:   Path of the SVG file to save
    :return:
    """
    try:
        file_handle = open(filepath, 'w')
    except IOError as e:
        print(str(e))
        exit(1)

    file_handle.write(svg)
    file_handle.close()

if __name__ == '__main__':
    parser = argparse.ArgumentParser(description='Process svg layers')
    parser.add_argument('source_file', action="store", help='Source SVG file path')
    parser.add_argument('-s', '--select', metavar='LAYER', action="append", help='Select a layer')
    parser.add_argument('-l', '--list', action="store_true", help='List all layers')
    parser.add_argument('-o', '--output', action="store", help='Output SVG file path')
    args = parser.parse_args()

    # if option list...
    if args.list:
        # Display inkscape layers list
        layers = get_layers(args.source_file)
        message = "{} layers\n".format(len(layers))
        for node in layers:
            message += "- {}\n".format(node.attributes['inkscape:label'].value)
        print(message)
        exit(0)

    # if option output...
    if args.output:
        svg = select_layers(args.source_file, args.select)
        save_svg(svg, args.output)
        exit(0)

    parser.print_help()
    exit(0)
