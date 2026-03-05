enum AttributeFieldType { dropdown, text, radio, toggle }

AttributeFieldType parseFieldType(String type) {
  switch (type.toLowerCase()) {
    case "select":
      return AttributeFieldType.dropdown;
    case "text":
      return AttributeFieldType.text;
    case "radio":
      return AttributeFieldType.radio;
    case "toggle":
      return AttributeFieldType.toggle;
    default:
      return AttributeFieldType.text;
  }
}