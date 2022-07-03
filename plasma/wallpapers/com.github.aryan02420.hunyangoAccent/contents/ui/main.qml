/*
 *   SPDX-FileCopyrightText: 2012 Marco Martin <mart@kde.org>
 *
 *   SPDX-License-Identifier: LGPL-2.0-or-later
 */

import QtQuick 2.0
import org.kde.plasma.core 2.0 as PlasmaCore

Rectangle {
    id: root
    width: 800
    height: 480

    function setColor() {
        root.color = PlasmaCore.Theme.highlightColor
    }

    Component.onCompleted: setColor()

    MouseArea {
        anchors.fill: parent
    }

    PlasmaCore.SvgItem {
        anchors.fill: parent
        smooth: true
        svg: PlasmaCore.Svg {
            id: wallpaperSvg
            //FIXME: Svg doesn't support relative paths
            imagePath: Qt.resolvedUrl("wallpaper.svgz").substring(7)
        }
    }
}
