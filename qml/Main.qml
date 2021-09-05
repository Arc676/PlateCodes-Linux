//Copyright (C) 2017-21 Arc676/Alessandro Vinciguerra <alesvinciguerra@gmail.com>

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

Page {
	anchors.fill: parent
	header: DefaultHeader {}

	function updateResults(index) {
		var results = ""
		try {
			var pattern = new RegExp(searchBox.text)
		} catch (e) {
			resultsBox.text = "(Invalid regex)"
			return
		}

		for (var i = 0; i < Data.searchItems[index].length; i++) {
			var element = Data.searchItems[index][i].toString()
			if (pattern.test(element)) {
				results += element + "\n"
			}
		}
		resultsBox.text = results
	}

	Label {
		id: promptLbl
		text: i18n.tr("Regex:")
		anchors {
			left: parent.left
			leftMargin: margin
			verticalCenter: searchBox.verticalCenter
		}
	}

	TextField {
		id: searchBox
		anchors {
			left: promptLbl.right
			leftMargin: margin
			right: parent.right
			rightMargin: margin
			top: header.bottom
			topMargin: margin
		}
		onTextChanged: updateResults(searchSpace.selectedIndex)
	}

	TextArea {
		id: resultsBox
		readOnly: true
		anchors {
			top: searchBox.bottom
			topMargin: margin
			bottom: searchSpace.top
			bottomMargin: margin
			leftMargin: margin
			rightMargin: margin
			horizontalCenter: parent.horizontalCenter
		}
		width: parent.width - 2 * margin
	}

	ListItem.ItemSelector {
		id: searchSpace
		anchors {
			bottom: parent.bottom
			bottomMargin: margin
			leftMargin: margin
			rightMargin: margin
			horizontalCenter: parent.horizontalCenter
		}
		width: parent.width - 2 * margin
		model: [
			i18n.tr("Embassies in Beijing, China"),
			i18n.tr("Chinese Provinces"),
			i18n.tr("Italian Provinces"),
			i18n.tr("Embassies in Berlin and Bonn, Germany"),
			i18n.tr("German Vehicle Licensing Authority Codes"),
			i18n.tr("Swiss Cantons"),
			i18n.tr("French Departments")
		]
		expanded: false
		onDelegateClicked: updateResults(index)
	}
}
