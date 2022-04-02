# openscad-study

## How to install CLI
https://en.wikibooks.org/wiki/OpenSCAD_User_Manual/Using_OpenSCAD_in_a_command_line_environment#Command_line_usage


## How to Animate Model
https://blog.prusa3d.com/how-to-animate-models-in-openscad_29523/


Convert Any 2D Image to a 3D Object Using OpenSCAD (and Only Free Software)
https://www.instructables.com/Convert-any-2D-image-to-a-3D-object-using-OpenSCAD/


https://en.wikibooks.org/wiki/OpenSCAD_User_Manual/Example/Strandbeest
https://en.wikibooks.org/wiki/OpenSCAD_User_Manual/Tips_and_Tricks


OpenSCADベストプラクティス
[* デバッグコマンドが便利]
	`*`で図形を隠す
		複数のモデルを出したり消したりできる
	`#`で図形をハイライト
		今操作している図形がどれかわからなくなった時便利
	`%`で処理と関係ない3D図形にする
	`!`その図形がrootとなる
		今操作している図形を中心に見たいときに便利

[* 精度]
	$fnはグローバルに定義する

[* 角を弧に丸める話]
	ある面からみたとき角丸になっていて、他は直角でよい場合はoffset
		offsetを2回適用することで、図形のサイズを変えずに角を丸くすることができる [fillet, smooth]
	上以外の複数の視点から角丸になっている場合は、minkowskiで角丸図形を作る。凹み形状の場合はそれで差分をとる
	https://en.wikibooks.org/wiki/OpenSCAD_User_Manual/Tips_and_Tricks#Filleting_objects は異常に重たくて使い物にならない

[* スケール]
	ある物体より、少し小さいものを別に作りたいとき（例えば箱の外形とその内側など）は、scaleしたスコープの中でそのある物体のスケールで記述するのが良い

[* 位置]
	基本的にはcenter=trueは悪手（のように思う 角の座標がソースコードに出てこない）
回転
	なるべく回転前に移動させておく（回転後に移動させるとわけわからなくなる）

[* 電子工作]
	KiCADのレイヤーをDXFで出力すると、そのまま利用できる。基板に合わせたケースを作る際などに便利
		ただしKiCADのレイヤー数が固定のため、せいぜい2レイヤーくらいしか使えないが

[* 知らない]
	角を弧以外に丸める方法
	角をbebel処理する方法
	Z方向に簡単にフィレットを設定する
		XY方向だとsmooth+filletでできるがZ方向は難しそう

[* できそうな気がする]
	図形のデバッグ方法（干渉していないかなど）
	図形の断面をさっと見る方法
	図形に文字をアノテーションとして入れる方法