/*
    SPDX-FileCopyrightText: 2012 Viranch Mehta <viranch.mehta@gmail.com>
    SPDX-FileCopyrightText: 2012 Marco Martin <mart@kde.org>
    SPDX-FileCopyrightText: 2013 David Edmundson <davidedmundson@kde.org>

    SPDX-License-Identifier: LGPL-2.0-or-later
*/

import QtQuick 2.0

import org.kde.plasma.core 2.0 as PlasmaCore

PlasmaCore.SvgItem {
    id: handRoot

    property alias rotation: rotation.angle
    property double svgScale
    readonly property double horizontalRotationCenter: width/2
    readonly property double verticalRotationCenter: height/2
    width: Math.round(naturalSize.width * svgScale) + Math.round(naturalSize.width * svgScale) % 2
    height: Math.round(naturalSize.height * svgScale) + width % 2

    anchors {
        top: clock.verticalCenter
        topMargin: -verticalRotationCenter
        left: clock.horizontalCenter
        leftMargin: -horizontalRotationCenter
    }

    svg: clockSvg
    transform: Rotation {
        id: rotation
        angle: 0
        origin {
            x: handRoot.horizontalRotationCenter
            y: handRoot.verticalRotationCenter
        }
        Behavior on angle {
            RotationAnimation {
                id: anim
                duration: PlasmaCore.Units.longDuration * 1.1
                direction: RotationAnimation.Clockwise
                easing.type: Easing.OutElastic
                easing.overshoot: 5
            }
        }
    }
}
