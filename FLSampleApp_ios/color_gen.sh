#!/bin/sh

set -eu

ASSETS_DIR="$PRODUCT_NAME/Assets.xcassets/Colors"
GENERATED_PATH="$PRODUCT_NAME/Generates/ColorGen.swift"

echo "import UIKit" > $GENERATED_PATH
echo "" >> $GENERATED_PATH
echo "extension UIColor {" >> $GENERATED_PATH

is_first_loop=1
for color in $(ls $ASSETS_DIR)
do
    set +eu
    echo $color | grep ".colorset" > /dev/null
    is_not_color=$?
    set -eu

    if [ $is_not_color == 0 ]
    then
        # echo $color
        color_name=$(echo $color | sed "s/\\.colorset//")
        echo $color_name
        json="$ASSETS_DIR/$color/Contents.json"
        echo "json = ",$json
        alpha=$(cat $json | jq ".colors[0].color.components.alpha" | sed "s/\"//g")
        red=$(cat $json | jq ".colors[0].color.components.red" | sed "s/\"//g")
        green=$(cat $json | jq ".colors[0].color.components.green" | sed "s/\"//g")
        blue=$(cat $json | jq ".colors[0].color.components.blue" | sed "s/\"//g") 
        echo "UIColor(red: $red, green: $green, blue: $blue, alpha: $alpha)"   

        if [ $is_first_loop == 0 ]
        then
            echo "" >> $GENERATED_PATH
        fi
        is_first_loop=0

        echo "  static func ${color_name}() -> UIColor {" >> $GENERATED_PATH
        echo "      UIColor(red: $red, green: $green, blue: $blue, alpha: $alpha)" >> $GENERATED_PATH
        echo "  }" >> $GENERATED_PATH
    fi
done

echo "}" >> $GENERATED_PATH
