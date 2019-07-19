create database cxpshop;
use cxpshop;
/* 用户表*/
create table user(
		uID int primary key auto_increment,
		username char(10) comment '用户名',
		password char(15) comment '密码',
		photoname varchar(50) comment '用户头像',
		money  decimal(10,2) default 6888.00 comment '余额'
);

insert user(username,password,money) values('cxp','123456',1433223.00);

/*商品种类*/
create table sort(
	sortID int primary key auto_increment,
	sortname varchar(20) comment '种类名称'
);
insert sort(sortId,sortname) values (1,'装饰品');
insert sort(sortId,sortname) values (2,'男装');
insert sort(sortId,sortname) values (3,'珠宝宝石项链首饰钻石戒指手镯玉石');
insert sort(sortId,sortname) values (4,'水果');
insert sort(sortId,sortname) values (5,'宠物猫狗鹦鹉熊蜗牛');
insert sort(sortId,sortname) values (6,'运动健身篮球');
insert sort(sortId,sortname) values (7,'女装');
insert sort(sortId,sortname) values (8,'童装');
insert sort(sortId,sortname) values (9,'手机');
insert sort(sortId,sortname) values (10,'美食');

/*店铺表*/
create table store(
		storeID int primary key auto_increment,
		storeName char(10) comment '店铺名',
		sProvince char(10) comment '**省',
		sCity char(5) comment '**市',
		sGradeDescribe float(2,1) default 4.8 comment '如实描述',
		sGradeAttitude float(2,1) default 4.8 comment '服务态度',
		sGradeDeliverySpeed float(2,1) default 4.8 comment '发货速度'
);
insert store(storeID,storeName,sProvince,sCity) values(1,'百货店铺','广东','深圳');
insert store(storeID,storeName,sProvince,sCity) values(2,'史塔克工业','美国','纽约');
insert store(storeID,storeName,sProvince,sCity) values(3,'珠宝店','','上海');
insert store(storeID,storeName,sProvince,sCity) values(4,'水果店','海南','海口');
insert store(storeID,storeName,sProvince,sCity) values(5,'宠物店','','北京');
insert store(storeID,storeName,sProvince,sCity) values(6,'运动健身店','浙江','杭州');
insert store(storeID,storeName,sProvince,sCity) values(7,'服装店','广东','广州 ');
insert store(storeID,storeName,sProvince,sCity) values(9,'手机店','广东','深圳');
insert store(storeID,storeName,sProvince,sCity) values(10,'美食店','浙江','杭州');

/*商品表*/
create table commodity(
		cID int primary key auto_increment,
		storeID int references  store(sid),
		sortID int references  commoditySort(sortid),
		cName varchar(40) comment '商品名',
		bao_you bool default false  comment '是否包邮',
		cDescribe varchar(50) comment '商品描述',
		cPhotoname varchar(30) comment '商品图片',
		cVideoname varchar(30) comment '商品视频',
		cPrice decimal(10,2) comment '价格',
		cSalesVolume int default 3000  comment '销量',
		cPopularity  int default 8000  comment '人气 (点击量)',
		cStock int default 9999 comment '库存'
);
/*购物车 中商品*/
create table shop_car(
		shop_carID int primary key auto_increment,
		uID	int references  user(uID),
		cID int references  commodity(cID),
		shop_number int comment '数量'
);

insert commodity(storeID,sortID,cName,cDescribe,bao_you,cPhotoname,cVideoname,cPrice) 
	values(1,1,'汽车摆件摇头公仔网红创意可爱表情包个性车载车内装饰品漂亮摆件','车内饰品摆件 可爱个性创意',false,'qi_che_bai_jian.jpg',null,28.00);
insert commodity(storeID,sortID,cName,cDescribe,bao_you,cPhotoname,cVideoname,cPrice)  
	values(1,1,'星空投影灯创意浪漫梦幻满天星月球灯旋转床头插电卧室睡眠小夜灯','星空投影 创意浪漫 送5套投影胶片',true,'xing_kong_deng.jpg',null,98.00);
insert commodity(storeID,sortID,cName,cDescribe,bao_you,cPhotoname,cVideoname,cPrice)  
	values(1,1,'巴基的左手','',true,'bj_rightHand.jpg',null,300.00);
insert commodity(storeID,sortID,cName,cDescribe,bao_you,cPhotoname,cVideoname,cPrice)  
	values(1,1,'牛顿摆钢铁侠混沌摆','',true,'hun_dun_bai.jpg',null,350.00);
insert commodity(storeID,sortID,cName,cDescribe,bao_you,cPhotoname,cVideoname,cPrice)  
	values(1,1,'正版大侦探皮卡丘公仔毛绒玩具儿童节礼物玩偶比卡丘抱枕','品质保证 可代写贺卡',true,'pi_ka_qiu.jpg',null,688.00);
insert commodity(storeID,sortID,cName,cDescribe,bao_you,cPhotoname,cVideoname,cPrice)  
	values(1,1,'创意美式鹿摆件花瓶客厅新房结婚礼物酒柜电视柜家居软装饰品摆设','吉祥摆件 既是装饰品 也是花瓶 美观又实用',false,'lu.jpg',null,233.00);
insert commodity(storeID,sortID,cName,cDescribe,bao_you,cPhotoname,cVideoname,cPrice)  
	values(1,1,'梵高星空客厅装饰画美式沙发背景墙横幅餐厅墙面墙画入户玄关油画','梵高星空 经典名画',false,'fan_gao.jpg',null,460.00);


insert commodity(storeID,sortID,cName,cDescribe,bao_you,cPhotoname,cVideoname,cPrice)  
	values(2,2,'MARK1 钢铁侠初代战甲','山洞中制作的第一件战甲',false,'mk1.jpg','mk1.mp4',1420.00);
insert commodity(storeID,sortID,cName,cDescribe,bao_you,cPhotoname,cVideoname,cPrice)  
	values(2,2,'MARK2 钢铁侠实验战甲','在实验室制作的第一件战甲',false,'mk2.jpg','mk2.mp4',1420.00);
insert commodity(storeID,sortID,cName,cDescribe,bao_you,cPhotoname,cVideoname,cPrice)  
	values(2,2,'MARK3 钢铁侠战甲','需要工具配合穿戴',false,'mk3.jpg','mk3.mp4',1466.00);
insert commodity(storeID,sortID,cName,cDescribe,bao_you,cPhotoname,cVideoname,cPrice)  
	values(2,2,'MARK5 钢铁侠旅行箱战甲','可折叠为旅行箱 方便携带',true,'mk5.jpg','mk5.mp4',1488.00);
insert commodity(storeID,sortID,cName,cDescribe,bao_you,cPhotoname,cVideoname,cPrice)  
	values(2,2,'MARK7 钢铁侠定位战甲','能通过手环定位 快速部署',true,'mk7.jpg','mk7.mp4',1520.00);
insert commodity(storeID,sortID,cName,cDescribe,bao_you,cPhotoname,cVideoname,cPrice)  
	values(2,2,'MARK38 钢铁侠千斤顶战甲','起重型战甲 可承受极端压力',false,'mk38.jpg','mk38.mp4',1588.00);
insert commodity(storeID,sortID,cName,cDescribe,bao_you,cPhotoname,cVideoname,cPrice)  
	values(2,2,'MARK41 钢铁侠分离战甲','可分离护甲片 独立飞行',true,'mk41.jpg','mk41.mp4',1600.00);
insert commodity(storeID,sortID,cName,cDescribe,bao_you,cPhotoname,cVideoname,cPrice)  
	values(2,2,'MARK42 钢铁侠经典战甲','经典战甲 远程控制',true,'mk42.jpg','mk42.mp4',1688.00);
insert commodity(storeID,sortID,cName,cDescribe,bao_you,cPhotoname,cVideoname,cPrice)  
	values(2,2,'MARK44 钢铁侠反浩特战甲','配备强大重武器 卫星补给',false,'mk44.jpg','mk44.mp4',1720.00);
insert commodity(storeID,sortID,cName,cDescribe,bao_you,cPhotoname,cVideoname,cPrice)  
	values(2,2,'MARK50 钢铁侠纳米战甲','纳米技术 便携 灵活',true,'mk50.jpg','mk50.mp4',1888.00);

insert commodity(storeID,sortID,cName,cDescribe,bao_you,cPhotoname,cVideoname,cPrice)  
	values(3,3,'玉吊坠男士观音和田玉石本命佛守护神女款属相项链生肖八大日如来','好玉好寓意 温润有方 支持鉴定 配证书',true,'yu_shi.jpg',null,256.00);
insert commodity(storeID,sortID,cName,cDescribe,bao_you,cPhotoname,cVideoname,cPrice)  
	values(3,3,'奇异博士项链阿戈摩托之眼时间宝石','HCMY复仇者联盟4奇异博士项链阿戈摩托之眼无限时间宝石可动底座',false,'shi_jian_bao_shi.jpg',null,988.00);
insert commodity(storeID,sortID,cName,cDescribe,bao_you,cPhotoname,cVideoname,cPrice)  
	values(3,3,'南孚宝石 一颗更比六颗强','一颗更比六颗强',true,'nfbs.jpg',null,1388.00);
insert commodity(storeID,sortID,cName,cDescribe,bao_you,cPhotoname,cVideoname,cPrice)  
	values(3,3,'幸运手镯 危难关头可以保护你','危难关头可以保护你',false,'shou_zhuo.jpg',null,588.00);
insert commodity(storeID,sortID,cName,cDescribe,bao_you,cPhotoname,cVideoname,cPrice)  
	values(3,3,'纯银紧箍咒戒指男女款一对金箍至尊宝情侣对戒孙悟空纪念礼物刻字','大话西游经典爱情故事 寓意着：爱你一万年',true,'jie_zhi.jpg',null,568.00);


insert commodity(storeID,sortID,cName,cDescribe,bao_you,cPhotoname,cVideoname,cPrice)  
	values(4,4,'烟台栖霞红富士苹果水果新鲜包邮当季丑苹果整箱5斤10','买2斤送3斤 共发5斤净重 收藏加购优先发货',false,'ping_guo.jpg',null,59.90);
insert commodity(storeID,sortID,cName,cDescribe,bao_you,cPhotoname,cVideoname,cPrice)  
	values(4,4,'四川青见柑橘大果新鲜水果 关爱舍友给他买个橘子吧','现摘现发“非”耙耙柑 带箱共10斤青见柑橘',true,'ju_zi.jpg',null,61.80);
insert commodity(storeID,sortID,cName,cDescribe,bao_you,cPhotoname,cVideoname,cPrice)  
	values(4,4,'福建火参果应季水果新鲜包邮 刺角瓜当季火参果批发','鲜嫩多汁，酸甜如初恋',true,'huo_sheng_guo.jpg',null,39.00);
insert commodity(storeID,sortID,cName,cDescribe,bao_you,cPhotoname,cVideoname,cPrice)  
	values(4,4,'正宗进口猫山王榴莲液氮冷冻保鲜带壳整个非金枕 顺丰包邮','整果进口 液氮保鲜 香甜软糯',false,'liu_lian.jpg',null,238.00);
insert commodity(storeID,sortID,cName,cDescribe,bao_you,cPhotoname,cVideoname,cPrice)  
	values(4,4,'南非进口新鲜当季红西柚水果孕妇红肉葡萄柚包邮','南非新季西柚，果硬肉红，送剥皮器！',true,'xi_you.jpg',null,39.80);

insert commodity(storeID,sortID,cName,cDescribe,bao_you,cPhotoname,cVideoname,cPrice)  
	values(5,5,'英国短毛猫金渐层矮脚猫咪纯种幼猫活物宠物活体星巴斯进口','本公司所售猫咪均为国外进口纯种高端血统。',false,'duan_mao_mao.jpg',null,4500.00);
insert commodity(storeID,sortID,cName,cDescribe,bao_you,cPhotoname,cVideoname,cPrice)  
	values(5,5,'纯种哈士奇幼犬三把火蓝眼哈士奇二哈狗雪橇犬哈士','哈士奇保纯',false,'er_ha.jpg',null,2000.00);
insert commodity(storeID,sortID,cName,cDescribe,bao_you,cPhotoname,cVideoname,cPrice)  
	values(5,5,'帅气单身狗 免费领走领走！!','我这该死无处安放的魅力！',true,'dan_sheng_gou.jpg',null,-1314.00);
insert commodity(storeID,sortID,cName,cDescribe,bao_you,cPhotoname,cVideoname,cPrice)  
	values(5,5,'鸟活体鹦鹉活宠物鸟体虎皮黄化情侣鹦鹉棕头云斑鹦鹉鸟粮玄凤','两个月包说话 教不会包换',false,'ying_wu.jpg',null,130.00);
insert commodity(storeID,sortID,cName,cDescribe,bao_you,cPhotoname,cVideoname,cPrice)  
	values(5,5,'小浣熊 代号89P13的生物基因强化实验体','拥有着与地球浣熊一样的嗅觉，感应能力，除此之外还是一个优秀的狙击手',true,'xiao_wang_xiong.jpg',null,2300.00);
insert commodity(storeID,sortID,cName,cDescribe,bao_you,cPhotoname,cVideoname,cPrice)  
	values(5,5,'白玉蜗牛活体科学实验巨型大蜗牛教学宿舍幼儿园学生观察宠物蜗牛','易养活',true,'xiao_wo_niu.jpg',null,10.00);


insert commodity(storeID,sortID,cName,cDescribe,bao_you,cPhotoname,cVideoname,cPrice)  
	values(6,6,'官网 YONEX尤尼克斯羽毛球鞋男鞋防滑减震透气yy训练运动鞋男女款','送YY鞋袋， 咨询有惊喜',false,'yun_don_xie.jpg',null,495.00);
insert commodity(storeID,sortID,cName,cDescribe,bao_you,cPhotoname,cVideoname,cPrice)  
	values(6,6,'蔡徐坤代言 斯伯丁NBA比赛篮球室内外耐磨PU材质','你打球的样子像极了蔡徐坤',true,'cxk_lanqiu.jpg','cxk_lanqiu.mp4',30.00);
insert commodity(storeID,sortID,cName,cDescribe,bao_you,cPhotoname,cVideoname,cPrice)  
	values(6,6,'夏季短袖t恤男士套装学生坎肩潮流运动两件一套搭配无袖衣服帅气','上衣+裤子！休闲2件套！棉品质更舒适',true,'yun_don_yi.jpg',null,89.00);

insert commodity(storeID,sortID,cName,cDescribe,bao_you,cPhotoname,cVideoname,cPrice)  
	values(7,7,'可爱少女蕾丝宽松灯笼袖长袖中长款防晒开衫外套','春装2019新款韩版',true,'nv_zhuang.jpg',null,39.80);

insert commodity(storeID,sortID,cName,cDescribe,bao_you,cPhotoname,cVideoname,cPrice)  
	values(7,8,'童装男童短袖套装夏装2019新款儿童中大童迷彩两件套街舞帅洋气潮','迷彩两件套街舞帅洋气潮',true,'tong_zhuang.jpg',null,69.00);

insert commodity(storeID,sortID,cName,cDescribe,bao_you,cPhotoname,cVideoname,cPrice)  
	values(9,9,'小米9手机Plus官方旗舰mix3骁龙855透明尊享版红米K20pro','可6期免息/可送20w无线快充',true,'xiao_mi_9.jpg',null,3699.00);


insert commodity(storeID,sortID,cName,cDescribe,bao_you,cPhotoname,cVideoname,cPrice)  
	values(10,10,'知味观绿豆糕盒装杭州特产桂花绿豆饼糕点好吃的传统美食抹茶零食','传统糕点多口味 休闲零食老字号工艺',false,'lv_dou_gao.jpg',null,27.80);
insert commodity(storeID,sortID,cName,cDescribe,bao_you,cPhotoname,cVideoname,cPrice)  
	values(10,10,'猪饲料零食大礼包女生一箱整超大巨型网红小吃休闲小食品散装自选','',true,'zhu_ci_liao.jpg',null,69.90 );
insert commodity(storeID,sortID,cName,cDescribe,bao_you,cPhotoname,cVideoname,cPrice)  
	values(10,10,'蜜汁烧鸭+青菜+米饭+汤+青菜','外形美观,风味独特',false,'shao_ya.jpg',null,30.99);
insert commodity(storeID,sortID,cName,cDescribe,bao_you,cPhotoname,cVideoname,cPrice)  
	values(10,10,'友臣肉松饼整箱休闲小吃糕点特产美食营养早餐食品网红零食面包','原味肉松饼',false,'rou_song_bin.jpg',null,42.80);
insert commodity(storeID,sortID,cName,cDescribe,bao_you,cPhotoname,cVideoname,cPrice)  
	values(10,10,'香辣鸡翅','将鸡翅加工成小巧造型，用经典的香辣腌料，手工裹上优质面粉，烹炸之黄金喷香。酥脆，鲜嫩，香辣。',true,'ji_chi.jpg',null,12.90);
insert commodity(storeID,sortID,cName,cDescribe,bao_you,cPhotoname,cVideoname,cPrice)  
	values(10,10,'全家福（15个全系饺子）','干捞全系列饺子',true,'shui_jiao.jpg',null,19.98);
insert commodity(storeID,sortID,cName,cDescribe,bao_you,cPhotoname,cVideoname,cPrice)  
	values(10,10,'客家猪肉沫腌面','客家肉末腌面 主要原料：猪肉',true,'zhu_zha_mian.jpg',null,12.8);
insert commodity(storeID,sortID,cName,cDescribe,bao_you,cPhotoname,cVideoname,cPrice)  
	values(10,10,'皮蛋瘦肉粥','主要原料：大米,猪肉',true,'pi_dan_shou_rou_zhou.jpg',null,14.8);
insert commodity(storeID,sortID,cName,cDescribe,bao_you,cPhotoname,cVideoname,cPrice)  
	values(10,10,'肉加蛋肠粉','主要原料：猪肉，鸡蛋',true,'chang_feng.jpg',null,11.00);
insert commodity(storeID,sortID,cName,cDescribe,bao_you,cPhotoname,cVideoname,cPrice)  
	values(10,10,'牛腩汤饭','潮味牛腩配上筒骨浓汤 还有香喷喷的米饭哦~',true,'niu_nang_tan_fan.jpg',null,24.99);
insert commodity(storeID,sortID,cName,cDescribe,bao_you,cPhotoname,cVideoname,cPrice)  
	values(10,10,'蔡林记免煮热干面方便面拌面条正宗武汉特产桶装泡面方便速食早餐','免煮 30秒即泡即食 吃热干面更方便',true,'re_gan_mian.jpg',null,35.60);
insert commodity(storeID,sortID,cName,cDescribe,bao_you,cPhotoname,cVideoname,cPrice)  
	values(10,10,'猪杂汤河粉','瘦肉+猪肝+猪心+粉肠+潮汕肉卷',true,'he_feng.jpg',null,16.99);
insert commodity(storeID,sortID,cName,cDescribe,bao_you,cPhotoname,cVideoname,cPrice)  
	values(10,10,'招牌白切鸡','新鲜鸡，绝无隔夜 主要原料：鸡肉',true,'bai_qie_ji.jpg',null,32.00);
insert commodity(storeID,sortID,cName,cDescribe,bao_you,cPhotoname,cVideoname,cPrice)  
	values(10,10,'烤鱼拼肥牛饭+底菜＋米饭','烤鱼配肥牛款式丰富多样，荤素均衡，健康美味。',false,'kao_yu.jpg',null,38.8);
insert commodity(storeID,sortID,cName,cDescribe,bao_you,cPhotoname,cVideoname,cPrice)  
	values(10,10,'招牌十三香小龙虾','主要原料：小龙虾',true,'xiao_long_xia.jpg',null,78.00);
insert commodity(storeID,sortID,cName,cDescribe,bao_you,cPhotoname,cVideoname,cPrice)  
	values(10,10,'清蒸大闸蟹','清蒸的原汁原味，最大限度的保留了大闸蟹的清鲜美味和营养',true,'pan_xie.jpg',null,65.50);
insert commodity(storeID,sortID,cName,cDescribe,bao_you,cPhotoname,cVideoname,cPrice)  
	values(10,10,'开水白菜','“开水白菜“被评为“中国菜”四川十大经典名菜',false,'kai_shui_bai_cai.jpg',null,88.50);
insert commodity(storeID,sortID,cName,cDescribe,bao_you,cPhotoname,cVideoname,cPrice)  
	values(10,10,'三文鱼寿司','铺上三文鱼肉和用酱油浸过的三文鱼籽、秋葵、蛋皮，最后撒上紫苏叶丝、紫菜',true,'san_wen_yu_shou_si.jpg',null,28.99);
