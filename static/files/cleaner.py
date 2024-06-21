import os
import xml.etree.ElementTree as ET

# Namespace eltávolító függvények
def strip_namespace(tag):
    if '}' in tag:
        return tag.split('}', 1)[1]
    else:
        return tag

def clean_xml_content(content):
    # Keressük meg az első XML deklarációt
    xml_declaration_index = content.find('<?xml')
    if xml_declaration_index != -1:
        # Távolítsuk el az XML deklaráció előtti részt
        content = content[xml_declaration_index:]
    return content

def process_xml(content):
    tree = ET.ElementTree(ET.fromstring(content))
    root = tree.getroot()

    for elem in root.iter():
        elem.tag = strip_namespace(elem.tag)

    return ET.tostring(root, encoding='utf-8', xml_declaration=True).decode('utf-8')

def remove_namespaces_from_all_xml_files(xml_file):
    xml_files = [f for f in os.listdir('.') if f.endswith('.xml')]

    for xml_file in xml_files:
        with open(xml_file, 'r', encoding='utf-8') as file:
            content = file.read()

        cleaned_content = clean_xml_content(content)
        processed_content = process_xml(cleaned_content)

        with open(xml_file, 'w', encoding='utf-8') as file:
            file.write(processed_content)


# Főprogram
def main(xml_file):
    # Namespace eltávolítása az összes XML fájlból
    #with open(xml_file, 'r', encoding='utf-8') as file:
     #   content = file.read()

    cleaned_content = clean_xml_content(xml_file)
    processed_content = process_xml(cleaned_content)

    with open('currFile.xml', 'w', encoding='utf-8') as file:
        file.write(processed_content)
    print("Namespace-ek eltávolítva az összes XML fájlból.")

    return 'currFile.xml'

