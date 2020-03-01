import configparser
import os


class InvalidParameterError(Exception):
    def __init__(self, msg):
        self.msg = msg

    def __str__(self):
        return repr(self.msg)


def create_xml_configuration(properties: dict, path: str):
    """Create an XML configuration and save it to a file"""

    try:
        import xml.etree.ElementTree as xml
    except ImportError:
        raise ImportError('Needs xml module')

    if properties is None:
        raise InvalidParameterError('Null properties')

    if path is None:
        raise InvalidParameterError('Null path')

    if len(properties) == 0:
        raise InvalidParameterError('Empty properties')

    # create xml root node
    root = xml.Element('configuration')

    # for each property create node element
    for key, value in properties.items():
        property = xml.Element('property')

        name_xml = xml.Element('name')
        name_xml.text = key

        value_xml = xml.Element('value')
        value_xml.text = value

        property.append(name_xml)
        property.append(value_xml)

        # append each property to root node
        root.append(property)

    # write xml tree to file
    try:
        xml.ElementTree(root).write(path)
        print('success')
    except Exception as err:
        raise err

def main():
    
    config_path = os.getenv('CONFIGURATION_INI_PATH', '/confs.ini')

    conf_dir = os.getenv('HADOOP_CONF_DIR', 'confs')
    
    config = configparser.ConfigParser()

    config.read(config_path)

    config = dict(config)
    del config['DEFAULT']

    for conf_prefix, properties in config.items():
        conf_path = '{}/{}-site.xml'.format(conf_dir, conf_prefix)
        create_xml_configuration(properties, conf_path)


if __name__ == '__main__':
    main()