//Copyright (C) 2019-21 Arc676/Alessandro Vinciguerra <alesvinciguerra@gmail.com>

//This program is free software: you can redistribute it and/or modify
//it under the terms of the GNU General Public License as published by
//the Free Software Foundation (version 3)

//This program is distributed in the hope that it will be useful,
//but WITHOUT ANY WARRANTY; without even the implied warranty of
//MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//GNU General Public License for more details.

//You should have received a copy of the GNU General Public License
//along with this program.  If not, see <http://www.gnu.org/licenses/>.

import QtQuick 2.4
import QtQuick.Layouts 1.1
import Ubuntu.Components 1.3

Page {
	id: aboutPage
	header: DefaultHeader {}

	ScrollView {
		id: scroll
		anchors {
			top: header.bottom
			topMargin: margin
			left: parent.left
			leftMargin: margin
			right: parent.right
			rightMargin: margin
			bottom: parent.bottom
		}

		Column {
			width: scroll.width
			spacing: margin

			WrappingLabel {
				text: "PlateCodes - " +i18n.tr("written by Arc676/Alessandro Vinciguerra. Project available under") + " GPLv3. Copyright 2017-21 Arc676/Alessandro Vinciguerra <alesvinciguerra@gmail.com>"
			}

			WrappingLabel {
				text: i18n.tr("This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation (version 3).")
			}

			WrappingLabel {
				text: i18n.tr("This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.")
			}

			WrappingLabel {
				text: i18n.tr("For the full license text, visit the <a href='https://github.com/Arc676/PlateCodes-Linux'>repository</a> or the <a href='http://www.gnu.org/licenses/'>GNU licenses page</a>")
			}

			WrappingLabel {
				text: i18n.tr("%1 assets").arg("<a href='https://creativecommons.org/licenses/by-nc-sa/4.0/'>CC BY-NC-SA 4.0</a>")
				textSize: Label.Large
			}

			WrappingLabel {
				text: i18n.tr("Application icon by Arc676/Alessandro Vinciguerra")
			}

			WrappingLabel {
				text: i18n.tr("All the content in this application is available under Wikipedia's Creative Commons License (Text of Creative Commons Attribution-ShareAlike 3.0 Unported License).\n\nThis means you are free to share and adapt the work under the condition that you attribute the source. You also must distribute the result under the same, similar, or compatible license.\n\nSources\nhttps://en.wikipedia.org/wiki/Vehicle_registration_plates_of_China\nhttps://en.wikipedia.org/wiki/Vehicle_registration_plates_of_Italy\nhttps://de.wikipedia.org/wiki/Diplomatenkennzeichen_(Deutschland)\nhttps://en.wikipedia.org/wiki/Vehicle_registration_plates_of_Switzerland\nhttps://de.wikipedia.org/wiki/Liste_der_Kfz-Kennzeichen_in_Deutschland\nhttps://en.wikipedia.org/wiki/Departments_of_France")
			}

		}
	}
}
