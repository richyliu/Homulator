#!/usr/bin/env bash
# -*- tab-width: 8 -*-

cd "$(dirname "$(realpath "${BASH_SOURCE[0]}")")"

# use heredoc to store expected output
expected_output=$(cat <<'EOF'
AUTO_(0) :	0
AUTO_(1) :	0
AUTO_(2) :	0
AUTO_(3) :	0
BCONV_(0) :	0
BCONV_(1) :	0
BCONV_(2) :	0
BCONV_(3) :	0
EWE_(0) :	6725
EWE_(1) :	6725
EWE_(2) :	6725
EWE_(3) :	6725
EWE_MEM_Stall_(0) :	8967
EWE_MEM_Stall_(1) :	8967
EWE_MEM_Stall_(2) :	8965
EWE_MEM_Stall_(3) :	8965
HBM_(0) :	6658
HBM_(1) :	6657
HBM_(2) :	6656
HBM_(3) :	6656
MEM_(0) :	4586497
MEM_(1) :	4586497
MEM_(2) :	4586497
MEM_(3) :	4586497
NTT_(0) :	0
NTT_(1) :	0
NTT_(2) :	0
NTT_(3) :	0
NoC_Mem_Chip :	509
EOF
)

cmd="./ForgeHomulator.run ./config/config_4.cfg padd 45 35 15"

# run the command and store the output
output=$($cmd 2>/dev/null)

# check if the output contains the expected output
if [[ "$output" =~ "$expected_output" ]]; then
    echo "Test passed"
    exit 0
else
    echo "Test failed"
    exit 1
fi
