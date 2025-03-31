#!/bin/bash

#In some cases, only these lines will work
for product in IntelliJIdea WebStorm DataGrip PhpStorm CLion PyCharm GoLand RubyMine; do
    rm -rf ~/.config/$product*/eval 2> /dev/null
    rm -rf ~/.config/JetBrains/$product*/eval 2> /dev/null
done

rm -rf ~/.config/JetBrains/IntelliJIdea*/idea.key 2> /dev/null
rm -rf ~/.config/JetBrains/PhpStorm*/phpstorm.key 2> /dev/null