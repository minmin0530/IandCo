//
//  DrawRaderChartView.swift
//  IandCo003
//
//  Created by 泉芳樹 on 2022/02/08.
//

import UIKit

class DrawRaderChartView: UIView {


    let maxPoints: [[CGFloat]] = [
        [-100, 0],
        [0, -100],
        [100, 0],
        [0, 100]
    ]

    var points: [CGFloat]?
    func setMaxPoints(points: [CGFloat]) {
        self.points = points
    }

    override func draw(_ rect: CGRect) {
        let vline = UIBezierPath();
        vline.move(to: CGPoint(x: 200.0 + 0, y: 200.0 + 100))
        vline.addLine(to:CGPoint(x: 200.0 + 0, y: 200.0 - 100))
        vline.close()
        UIColor.gray.setStroke()
        vline.lineWidth = 1
        vline.stroke();

        let hline = UIBezierPath();
        hline.move(to: CGPoint(x: 200.0 + 100, y: 200.0 + 0))
        hline.addLine(to:CGPoint(x: 200.0 - 100, y: 200.0 + 0))
        hline.close()
        UIColor.gray.setStroke()
        hline.lineWidth = 1
        hline.stroke();



        // 四角形 -------------------------------------
        // UIBezierPath のインスタンス生成
        let line = UIBezierPath();
        line.move(to: CGPoint(x: 200.0, y: 200.0 + 20 * self.points![self.points!.count - 1]))
        line.addLine(to:CGPoint(x: 200.0 - 20 * self.points![0], y: 200.0))
        line.addLine(to:CGPoint(x: 200.0, y: 200.0 - 20 * self.points![1]))
        line.addLine(to:CGPoint(x: 200.0 + 20 * self.points![2], y: 200.0))
        line.addLine(to:CGPoint(x: 200.0, y: 200.0 + 20 * self.points![3]))

        line.close()
        // 色の設定
        UIColor.black.setStroke()
        UIColor.init(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.5).setFill()
        // ライン幅
        line.lineWidth = 3
        // 描画
        line.stroke();
        line.fill()

        for i in 1...5 {
            let line = UIBezierPath();
            line.move(to: CGPoint(x: 200.0 + maxPoints[3][0] / 5.0 * CGFloat(i), y: 200.0 +  maxPoints[3][1] / 5.0 * CGFloat(i)))
            for points in maxPoints {
                line.addLine(to:CGPoint(x: 200.0 + points[0] / 5.0 * CGFloat(i), y: 200.0 +  points[1] / 5.0 * CGFloat(i)))
            }
            line.close()
            // 色の設定
            UIColor.gray.setStroke()
            // ライン幅
            line.lineWidth = 1
            // 描画
            line.stroke();
        }

//        // 楕円 -------------------------------------
//        let oval = UIBezierPath(ovalIn:
//            CGRect(x: 140, y: 190, width: 90, height: 140))
//
//        // 塗りつぶし色の設定
//        UIColor.gray.setFill()
//        // 内側の塗りつぶし
//        oval.fill()
//
//        // stroke 色の設定
//        UIColor.green.setStroke()
//        // ライン幅
//        oval.lineWidth = 2
//        // 描画
//        oval.stroke()
//
//
//        // 矩形 -------------------------------------
//        let rectangle = UIBezierPath(rect: CGRect(x: 200,y: 370,width: 120,height: 100))
//        // stroke 色の設定
//        UIColor.magenta.setStroke()
//        // ライン幅
//        rectangle.lineWidth = 8
//        // 描画
//        rectangle.stroke()
//
//
//        // 角が丸い矩形 -------------------------------------
//        let roundRect = UIBezierPath(roundedRect: CGRect(x: 50, y: 600, width: 210, height: 70), cornerRadius: 10)
//        // stroke 色の設定
//        UIColor.yellow.setStroke()
//        roundRect.lineWidth = 6
//        roundRect.stroke()
//
//
//        // 円弧 -------------------------------------
//        let arc = UIBezierPath(arcCenter: CGPoint(x:180, y:170), radius: 85,  startAngle: 0, endAngle: CGFloat(Double.pi)*4/3, clockwise: true)
//        // 透明色設定
//        let aColor = UIColor(red: 1, green: 1, blue: 0.6, alpha: 0.8)
//        aColor.setStroke()
//        arc.lineWidth = 10
//
//
//        // 点線のパターンをセット
//        let dashPattern:[CGFloat] = [ 1 , 4 ]
//        arc.setLineDash(dashPattern, count: 2, phase: 0)
//        arc.stroke()
    }
}
