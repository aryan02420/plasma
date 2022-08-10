/*
    SPDX-FileCopyrightText: 2013 David Edmundson <davidedmundson@kde.org>

    SPDX-License-Identifier: GPL-2.0-or-later
*/

import QtQuick 2.0
import QtQuick.Controls 2.0
import org.kde.kirigami 2.5 as Kirigami


Kirigami.FormLayout {
    property alias cfg_showSecondHand: showSecondHandCheckBox.checked
    property alias cfg_showMinuteHand: showMinuteHandCheckBox.checked
    property alias cfg_showHourHand: showHourHandCheckBox.checked

    property alias cfg_show12: show12CheckBox.checked
    property alias cfg_show3: show3CheckBox.checked
    property alias cfg_show6: show6CheckBox.checked
    property alias cfg_show9: show9CheckBox.checked

    property alias cfg_showBigTicks: showBigTicksCheckBox.checked
    property alias cfg_showSmallTicks: showSmallTicksCheckBox.checked

    property alias cfg_showFace: showFaceCheckBox.checked


    anchors {
        left: parent.left
        right: parent.right
    }

    CheckBox {
        id: showSecondHandCheckBox
        text: i18n("Seconds")
        Kirigami.FormData.label: i18n("Hands:")
    }

    CheckBox {
        id: showMinuteHandCheckBox
        text: i18n("Minutes")
    }

    CheckBox {
        id: showHourHandCheckBox
        text: i18n("Hours")
    }

    Item {
        Kirigami.FormData.isSection: true
    }

    CheckBox {
        id: show12CheckBox
        text: i18n("12")
        Kirigami.FormData.label: i18n("Numbers:")
    }

    CheckBox {
        id: show3CheckBox
        text: i18n("3")
    }

    CheckBox {
        id: show6CheckBox
        text: i18n("6")
    }

    CheckBox {
        id: show9CheckBox
        text: i18n("9")
    }
    
    Item {
        Kirigami.FormData.isSection: true
    }

    CheckBox {
        id: showBigTicksCheckBox
        text: i18n("Big")
        Kirigami.FormData.label: i18n("Ticks:")
    }

    CheckBox {
        id: showSmallTicksCheckBox
        text: i18n("Small")
    }
    
    Item {
        Kirigami.FormData.isSection: true
    }

    CheckBox {
        id: showFaceCheckBox
        text: i18n("Face")
        Kirigami.FormData.label: i18n("")
    }
}
