//Copyright (C) 2017 Arc676/Alessandro Vinciguerra <alesvinciguerra@gmail.com>

//This program is free software: you can redistribute it and/or modify
//it under the terms of the GNU General Public License as published by
//the Free Software Foundation (version 3)

//This program is distributed in the hope that it will be useful,
//but WITHOUT ANY WARRANTY; without even the implied warranty of
//MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//GNU General Public License for more details.

//You should have received a copy of the GNU General Public License
//along with this program.  If not, see <http://www.gnu.org/licenses/>.
//See README and LICENSE for more details

import QtQuick 2.4
import Ubuntu.Components 1.3
import Ubuntu.Components.ListItems 1.3 as ListItem
import "Data.js" as Data

MainView {
    // objectName for functional testing purposes (autopilot-qt5)
    objectName: "mainView"
    id: root

    // Note! applicationName needs to match the "name" field of the click manifest
    applicationName: "platecodes.arc676"

    width: units.gu(100)
    height: units.gu(80)

    property real sideMargin: units.gu(1)

    //taken from this site
    //https://makandracards.com/makandra/15879-javascript-how-to-generate-a-regular-expression-from-a-string
    function esc(string) {
        return string.replace(/[-\/\\^$*+?.()|[\]{}]/g, '\\$&')
    }

    function updateResults() {
        var results = ""
        try {
            var pattern = new RegExp(searchBox.text)
        } catch (e) {
            resultsBox.text = "(Invalid regex)"
            return
        }

        for (var i = 0; i < Data.searchItems[searchSpace.selectedIndex].length; i++) {
            var element = Data.searchItems[searchSpace.selectedIndex][i].toString()
            if (pattern.test(element)) {
                results += element + "\n"
            }
        }
        resultsBox.text = results
    }

    Page {
        header: PageHeader {
            id: pageHeader
            title: i18n.tr("PlateCodes")
            StyleHints {
                foregroundColor: UbuntuColors.orange
                backgroundColor: UbuntuColors.porcelain
                dividerColor: UbuntuColors.slate
            }
        }

        Label {
            id: prompt
            text: i18n.tr("Regex:")
            anchors {
                left: parent.left
                top: pageHeader.bottom
                leftMargin: sideMargin
                topMargin: units.gu(2)
            }
        }

        TextField {
            id: searchBox
            anchors {
                left: prompt.right
                top: pageHeader.bottom
                leftMargin: sideMargin
                topMargin: sideMargin
                verticalCenter: prompt.verticalCenter
            }
            height: units.gu(3)
            width: parent.width - prompt.width - 3 * sideMargin
            onTextChanged: {
                updateResults()
            }
        }

        TextArea {
            id: resultsBox
            anchors {
                top: searchBox.bottom
                horizontalCenter: parent.horizontalCenter
                topMargin: sideMargin
                bottomMargin: sideMargin
                leftMargin: sideMargin
                rightMargin: sideMargin
            }
            height: parent.height - pageHeader.height - searchBox.height
                    - searchSpace.height - aboutButton.height - 7 * sideMargin
            width: parent.width - 2 * sideMargin
        }

        ListItem.ItemSelector {
            id: searchSpace
            anchors {
                top: resultsBox.bottom
                topMargin: sideMargin
                bottomMargin: sideMargin
                leftMargin: sideMargin
                rightMargin: sideMargin
                horizontalCenter: parent.horizontalCenter
            }
            width: parent.width - 2 * sideMargin
            model: [
                "Embassies in Beijing",
                "Provinces in China",
                "Provinces in Italy",
                "German embassies",
                "German Kfz-Zulassungsbehörden",
                "Swiss cantons",
                "French departments"
            ]
            expanded: true
        }

        Button {
            id: aboutButton
            anchors {
                top: searchSpace.bottom
                topMargin: sideMargin
                bottomMargin: sideMargin
                leftMargin: sideMargin
                rightMargin: sideMargin
                horizontalCenter: parent.horizontalCenter
            }
            width: parent.width - 2 * sideMargin
            text: i18n.tr("About PlateCodes")
            onClicked: {
                var component = Qt.createComponent("About.qml")
                var window = component.createObject(root)
                window.show()
            }
        }
    }
}