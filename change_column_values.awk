#!/usr/bin/awk -f

{
  num_fields = parse_csv($0, csv, ",", "'", "'", "\\n", 1);
  if (num_fields < 0) {
    printf "ERROR: %s (%d) -> %s\n", csverr, num_fields, $0;
  } else {
    for (i = 0;i < num_fields;i++) {
      if (i == column && csv[i] == increment_to_change) {
        printf new_increment_value ",";
      } else {
        printf "%s,", csv[i];
      }
    }
    printf "\n";
  }
}