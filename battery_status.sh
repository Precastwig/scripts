#!/bin/bash
#
# battery status script
#

CHARGE=`exec acpi | awk '{print $4}'`
CHARGE=${CHARGE::-1}
[[ $CHARGE == *% ]] && CHARGE=${CHARGE::-1}
# case "${CHARGE}" in
#    '100%')
#    CHARGE=${CHARGE::-1}
#    ;;
#    '99%')
#    CHARGE=${CHARGE::-1}
#    ;;
#    '98%')
#    CHARGE=${CHARGE::-1}
#    ;;
#    '97%')
#    CHARGE=${CHARGE::-1}
#    ;;
#    *)
#    CHARGE=${CHARGE::-2}
# esac

NON='\033[00m'
BLD='\033[01m'
RED='\033[01;31m'
GRN='\033[01;32m'
YEL='\033[01;33m'

COLOUR="$RED"
SCOLOUR="$RED"

BATSTATE=`exec acpi | awk '{print $3}'`
BATSTATE=${BATSTATE::-1}

case "${BATSTATE}" in
   'Unknown')
   BATSTT="$BLD="
   ;;
   'Charging')
   BATSTT="$BLD+"
   ;;
   'Discharging')
   BATSTT="$BLD-"
   ;;
esac

# prevent a charge of more than 100% displaying
if [ "$CHARGE" -gt "99" ]
then
   CHARGE=100
fi

if [ "$CHARGE" -gt "25" ]
then
   COLOUR="$YEL"
fi

if [ "$CHARGE" -gt "50" ]
then
   COLOUR="$GRN"
fi

echo -e "${COLOUR}[${CHARGE}%]${BATSTT}${NON}"

# end of file