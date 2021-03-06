-- MySQL dump 10.13  Distrib 5.7.31, for Win64 (x86_64)
--
-- Host: localhost    Database: nsca_cpt_original_exercise
-- ------------------------------------------------------
-- Server version	5.7.31-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `chapters`
--

DROP TABLE IF EXISTS `chapters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chapters` (
  `id` int(11) NOT NULL,
  `part_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKp18xktybocmdw2oys6gd46fvt` (`part_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chapters`
--

LOCK TABLES `chapters` WRITE;
/*!40000 ALTER TABLE `chapters` DISABLE KEYS */;
INSERT INTO `chapters` VALUES (1,1,'筋系、神経系、骨格系の構造と機能'),(2,1,'心肺系とガス交換'),(3,1,'生体エネルギー機構'),(4,1,'バイオメカニクス'),(5,1,'レジスタンストレーニングへの適応'),(6,1,'有酸素性持久力トレーニングへの生理学的な応答と適応'),(7,1,'パーソナルトレーニングにおける栄養'),(8,1,'パーソナルトレーナーのための運動心理学'),(9,2,'クライアントの面談と健康評価'),(10,2,'体力評価の選択と管理'),(11,2,'体力テスト法と評価基準'),(12,3,'柔軟性、自重、スタビリティボール・エクササイズ'),(13,3,'レジスタンストレーニングのエクササイズテクニック'),(14,3,'心臓血管系のトレーニング方法'),(15,4,'レジスタンストレーニングのプログラムデザイン'),(16,4,'有酸素性持久力トレーニングのプログラムデザイン'),(17,4,'プライオメトリックトレーニングとスピードトレーニング'),(18,5,'前青年期の子ども、高齢者、妊婦のクライアント'),(19,5,'栄養と代謝に問題を抱えるクライアント'),(20,5,'心臓血管系疾患および呼吸器系疾患を有するクライアント'),(21,5,'整形外科的疾患や傷害を有するクライアントとリハビリテーション'),(22,5,'脊髄損傷、多発性硬化症、てんかん、脳性麻痺患者について'),(23,5,'アスリートを対象にしたレジスタンストレーニング'),(24,6,'施設と機器の配置およびメンテナンス'),(25,6,'パーソナルトレーニングの法的側面');
/*!40000 ALTER TABLE `chapters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exercises`
--

DROP TABLE IF EXISTS `exercises`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exercises` (
  `id` int(11) NOT NULL,
  `choice_a` longtext NOT NULL,
  `choice_b` longtext NOT NULL,
  `choice_c` longtext NOT NULL,
  `choice_d` longtext NOT NULL,
  `correct_answer` varchar(255) NOT NULL,
  `explanation` longtext NOT NULL,
  `question` longtext NOT NULL,
  `chapter_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKieq04t8ly5h9hw75l965b81kf` (`chapter_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exercises`
--

LOCK TABLES `exercises` WRITE;
/*!40000 ALTER TABLE `exercises` DISABLE KEYS */;
INSERT INTO `exercises` VALUES (1,'筋は横紋筋と平滑筋の2種類に分類される。','平滑筋は骨格筋と心筋に分類される。','骨格筋は骨に付着し、関節を中心に骨を回転させることで動作を可能にする。','心筋は不随意筋である。','B','Bが誤り。骨格筋と心筋に分類されるのは横紋筋である。\r\nDの不随意筋は自分の意思で動かすことのできない筋であり、平滑筋と心筋が該当する。対して随意筋は自分の意思で動かすことができる筋であり、骨格筋が該当する。','筋について誤っているものを選びなさい。',1),(2,'大腿直筋','大内転筋','外側広筋','中間広筋','B','Bが誤り。大腿四頭筋を構成する筋は、大腿直筋・内側広筋・外側広筋・中間広筋の4つである。\r\n大内転筋は股関節内転筋群の1つである。','大腿四頭筋を構成する筋のうち、誤っているものを選びなさい。',1),(3,'筋外膜','筋周膜','筋内膜','筋鞘','B','筋外膜は個々の骨格筋（三角筋、大胸筋、腓腹筋など）、筋周膜は筋線維束、筋内膜は筋線維を覆っている結合組織である。\r\nまた、筋鞘は個々の筋線維を覆う細胞膜である。','筋線維束は何と呼ばれる結合組織によって覆われているか。',1),(1001,'血液量は体重の約6分の1を占める。','全血のうち、血漿が約55%、血球が約45%を占める。','血球は赤血球、白血球、血小板からなり、その大部分は赤血球が占めている。','ヘモグロビンは赤血球中に含まれる鉄含有タンパク質であり、酸素を運搬することができる。','A','Aが誤り。血液量は体重の約13分の1を占める。','人間の血液について誤っているものを選びなさい。',2),(2001,'エネルギー供給機構は、大きくホスファゲン機構、解糖系、酸化機構の3つに分けられる。','炭水化物がグルコースに分解されるような、大きな分子から小さな分子への分解によりエネルギーが放出される過程を同化作用という。','三大栄養素のうち、脂質だけが直接的に酸素なしでエネルギー産生のために代謝される。','ATPがリン酸基を受け取ることにより、エネルギーが供給される。','A','B：同化作用でなく異化作用が正しい。\r\nC：脂質でなく炭水化物が正しい。\r\nD：ATPからリン酸基が除去されることにより、エネルギーが供給される。','エネルギーについて正しいものを選びなさい。',3),(3001,'デッドリフト','スクワット','ベンチプレス','ショルダープレス','D','A.デッドリフト：矢状面、B.スクワット：矢状面、C.ベンチプレス：水平面、D.ショルダープレス：前額面','前額面上の動作をするエクササイズを選びなさい。',4),(4001,'水素イオン濃度','ATP濃度','CP濃度','グリコーゲン濃度','A','A.水素イオン濃度：増加、B.ATP濃度：変化なし、またはわずかに減少、C.CP濃度：減少、D.グリコーゲン濃度：減少','レジスタンストレーニングに対する短期的反応について、増加するものを選びなさい。',5),(5001,'内臓血流量','肺の分時換気量','血中乳酸','カテコールアミン','A','A.内臓血流量：減少、B.肺の分時換気量：増加、C.血中乳酸：増加、D.カテコールアミン：増加','有酸素性運動に対する短期的応答について、減少または低下するものを選びなさい。',6),(6001,'糖質','脂質','タンパク質','ビタミン','D','三大栄養素は糖質、脂質、タンパク質。これにビタミン、ミネラルを加えたものを五大栄養素という。','三大栄養素に含まれないものを選びなさい。',7),(7001,'状態不安は、実際に経験する不安と定義され、特に自律神経系が介在する生理的覚醒の増加を伴う不安感や恐怖感を特徴とする。','特性不安は、状況を脅威として認知する傾向があるかどうかに関する気質的な要因である。','高強度エクササイズ後の反動的な「爽快感」は、βエンドルフィンや精神安定に重要な神経伝達物質（セロトニンなど）の分泌を含む、生理学的応答が現れることが原因である。','運動はドーパミンとその受容体の結合感受性を低めるため、うつやパーキンソン病を軽減する。','D','Dが誤り。運動はドーパミンとその受容体の結合感受性を高めることで、うつやパーキンソン病を軽減する。','運動による効果について誤っているものを選びなさい。',8),(8001,'クライアントとトレーナーの契約の成立','クライアントとトレーナーの適合性の評価','健康評価スクリーニング','目標についての話し合い','C','初回面談では、パーソナルトレーナーとクライアントは相互の適合性を評価し、目標を立て、両者が合意する。その後、エクササイズプログラム参加前に健康評価スクリーニングを行う。','クライアントとの面談後に行うべきものはどれか選びなさい。',9),(9001,'室内温度は77～86℉（25～30℃）に設定する。','湿度は60%以下に設定する。','有酸素性持久力テストは高度1900フィート（580m）未満で行う。','1時間につき6～8回の換気を行う。','A','Aが誤り。室内温度は68～72℉（20～22℃）に設定する。','体力テストの実施環境について誤っているものを選びなさい。',10),(10001,'男性の平均心拍数は女性よりも7～10拍/分ほど多い。','短時間（6、10、15秒）での心拍数計測は時間的に効率がよいだけでなく、運動強度の変化に伴って心拍数が急に変動するため、瞬間的な心拍数をより正確に表しているといえる。','心拍数を触診法で測定する場合、親指で脈を触る。','標準的な安静時心拍数は60～100拍/分であり、60拍/分より少ないと頻脈、100拍/分より多いと徐脈に分類される。','B','A：女性の平均心拍数は男性よりも7～10拍/分ほど多い。\r\nC：心拍数を触診法で測定する場合、人差し指と中指の先で脈を触る。\r\nD：60拍/分より少ないと徐脈、100拍/分より多いと頻脈に分類される。','心拍数や脈拍について正しいものを選びなさい。',11),(11001,'柔軟性トレーニングはウォームアップの1つであり、トレーニング開始前に必ず行う必要がある。','可動域全体を使って行うレジスタンストレーニングプログラムは、柔軟性を向上させる効果がある。','柔軟性は各関節に特有のものであるため、1つの関節の柔軟性テストの結果を全身の柔軟性として評価することは誤りである。','柔軟性は1つまたは複数の関節における可動域として定義される。','A','Aが誤り。柔軟性トレーニングとウォームアップは別物。あらゆるワークアウトはいかに時間に制約があろうとも、必ずウォームアップセッションから始めなければならない。一方、柔軟性トレーニングをいつ行うべきかは、ワークアウト中に行う活動内容に基づいて決定する。','柔軟性トレーニングについて誤っているものを選びなさい。',12),(12001,'スピネイティッドグリップ','ニュートラルグリップ','プロネイティッドグリップ','アンダーハンドグリップ','C','手のひらが下、手の甲が上になるグリップ：プロネイティッドグリップ（オーバーハンドグリップ）\r\n手のひらが上、手の甲が下になるグリップ：スピネイティッドグリップ（アンダーハンドグリップ）\r\n手のひらが内側、手の甲が外側になるグリップ：ニュートラルグリップ','グリップの種類について、手のひらが下、手の甲が上になるグリップを何というか。',13),(13001,'少なくとも運動の30分前に、体重1 kgあたり約10～12 mLの水分を摂取する。','少なくとも運動の4時間前に、体重1 kgあたり約5～7 mLの水分を摂取する。','運動前後の体重減少1ポンド（約450 g）につき、40～48オンス（約1.2～1.4 L）の水分を摂取する。','運動前後の体重減少量の半分量の水分を摂取する。','B','運動後の水分摂取については、運動前後の体重減少1ポンド（約450 g）につき、20～24オンス（約0.6～0.7 L）の水分を摂取するべきとされている。','心臓血管系活動における水分補給について正しいものを選びなさい。',14),(14001,'意識性の原理','過負荷の原理','可逆性の原理','特異性の原理','A','Aが誤り。\r\n3つの原理：可逆性の原理、過負荷の原理、特異性の原理\r\n5つの原則：意識性の原則、個別性の原則、漸進性の原則、全面性の原則、反復性の原則','トレーニングの3つの原理ではないものを選びなさい。',15),(14002,'漸進的過負荷とは、クライアントの適応状態に応じてトレーニングストレスを増加させることをいう。','バリエーションとは、量、強度、エクササイズ種目、トレーニング頻度、休息時間、動作速度など、特定のトレーニング変数を変化させることである。','特異性とは、ある特定の変化や結果をもたらすために、ある特定の方法でクライアントのトレーニングを行うことをいう。','ピリオダイゼーションとは、「単調なプログラムによるオーバートレーニング」状態になったクライアントに対して、一定期間休息を与えることをいう。','D','Dが誤り。ピリオダイゼーションとは、ある時点におけるパフォーマンスを最適化するために、トレーニング変数を論理的かつ段階的に調整することである。適切なトレーニングバリエーションがプログラムに組み込まれていない場合、向上はやがて止まり、停滞もしくは低下が生じ、「単調なプログラムによるオーバートレーニング」といわれる状態をもたらす。','トレーニング原理について誤っているものを選びなさい。',15),(15001,'125～147拍/分','134～153拍/分','152～165拍/分','154～176拍/分','C','カルボーネン法\r\n式：年齢推定最大心拍数[APMHR] = 220 - 年齢\r\n　　予備心拍数[HRR] = APMHR - 安静時心拍数[RHR]\r\n　　目標心拍数[THR] = (HRR × 運動強度) + RHR\r\n上限と下限を求めるためにこの計算を2回行い、目標心拍数範囲[THRR]を求める。','安静時心拍数が60拍/分の29歳のクライアントのために、有酸素性持久力トレーニングのプログラムを作成する。カルボーネン法を用いてクライアントの予備心拍数の70～80 %の強度を設定する場合の目標心拍数範囲を選びなさい。',16),(16001,'プライオメトリックスは素早く力強い動作であり、カウンタームーブメント（反動動作）または予備伸張といわれる伸張性筋活動と、その直後の短縮性筋活動とで成り立っている。','伸張反射とは、筋を素早く伸長させる外部刺激に対する不随意的な身体反応である。','伸張反射の反応時間はトレーニングを行うと短くなる。','伸張-短縮サイクル（ストレッチ-ショートニングサイクル、SSC）において最も重視すべきは償却局面であり、この時間はできるだけ短くしなければならない。','C','Cが誤り。伸張反射の反応時間はトレーニングを行っても全く変化しないが、筋収縮に伴う反応の強さはトレーニングで増大し、パワーの向上をもたらす。','プライオメトリックトレーニングについて誤っているものを選びなさい。',17),(16002,'下半身のプライオメトリックスを行うには、スクワットの1RMが少なくとも体重の1.5倍必要である。','下半身のプライオメトリックスを行うには、体重の60 %負荷でスクワットを5秒以内に5回反復できる必要がある。','上半身のプライオメトリックスを行うには、体重が220ポンド（100 kg）未満のクライアントでは、ベンチプレスの1RMが少なくとも体重の1.5倍必要である。','ベンチプレスによる判断に代わる上半身に必要な筋力の目安は、10回連続でクラッププッシュアップを行えることである。','D','Dが誤り。ベンチプレスでなくクラッププッシュアップで判断する際は、クラッププッシュアップを5回連続で行えることが判断基準となる。','クライアントのプライオメトリックトレーニングプログラム参加可否を決定する際のガイドラインとして誤っているものを選びなさい。',17),(16003,'使用する部位に関係なく、全身に現在損傷がない。','少なくとも3か月のレジスタンストレーニング経験がある。','それぞれのドリルの適切なテクニックを習得している。','実施するドリルのレベルに十分な筋力とスピード、バランスがある。','A','Aが誤り。使用する部位に損傷がなければ行ってよい。','プライオメトリックトレーニングプログラムを行うための必要条件として誤っているものを選びなさい。',17),(17001,'様々なエクササイズ種目を1セット15～20レップで少なくとも5セット行う。','レジスタンストレーニングの前には5～10分間の動的なウォームアップを行う。','筋力の向上に伴い、段階的に負荷を増加させる（例：5～10 %程度）。','1週間のうち、連続しない2～3日にレジスタンストレーニングを行う。','A','Aが誤り。1セット6～15レップで1～3セット行う。','青少年のためのレジスタンストレーニングのガイドラインとして誤っているものを選びなさい。',18),(18001,'19','21','22','24','B','体格指数[BMI] = 体重(kg) ÷ 身長の2乗(m2)\r\nつまり、57 ÷ 1.65 ÷ 1.65 ≒ 21','身長165 cm、体重57 kgの人のBMIはいくつか。',19),(19001,'収縮期血圧が140～159 mmHgのとき、ステージ1の高血圧に該当する。','拡張期血圧が80 mmHg以上のとき、ステージ1の高血圧に該当する。','血圧の測定値がステージ1に該当するクライアントは、医師による許可を得ずともトレーニングを行ってもよい。','高血圧をコントロールできているクライアントでも、エクササイズを行ってはならない。','A','B.拡張期血圧が90～99 mmHgのとき、ステージ1の高血圧に該当する。\r\nC.血圧の測定値がステージ1または2（140 mmHg以上/90 mmHg以上）に該当するクライアントは、医師による処方によって血圧がコントロールされ、医師による許可が下りるまではトレーニングを行うべきではない。\r\nD.高血圧をコントロールできているクライアントは、制限された範囲内でエクササイズを行うことができる。','血圧とトレーニングについて正しいものを選びなさい。',20),(20001,'ベントオーバーロウ','スクワット','ショルダープレス','シットアップ','C','腰部椎間板症のクライアントは、腰椎の屈曲が生じるエクササイズは避けるべきと推奨されている。','腰部椎間板症（椎間板ヘルニア）のクライアントが避けるべき、または注意すべきエクササイズとして誤っているものを選びなさい。',21),(20002,'アブドミナルクランチ','ショルダープレス','スクワット','プッシュプレス','A','脊椎分離症および脊椎すべり症のクライアントは、腰部の伸展を含むエクササイズは避けるべきと推奨されている。','脊椎分離症および脊椎すべり症のクライアントが避けるべき、または注意すべきエクササイズとして誤っているものを選びなさい。',21),(21001,'すべての機能している筋群に対して、8～12レップで3セット、週2～3回の一般的なレジスタンストレーニングプログラムが推奨される。','有酸素性エクササイズは中強度から開始し、徐々に持続時間、頻度、強度を上げていき、最終的には1日30分、週4回以上行うことを目標とする。','有酸素性エクササイズの強度は心拍数によりモニタリングする。','運動誘発性低血圧を防止するために、安静時およびエクササイズ中に血圧を定期的に測定し、特に直立姿勢でのエクササイズ中は頻繁に測定する必要がある。','C','Cが誤り。有酸素性エクササイズの強度を心拍数によりモニタリングすることは、様々な理由（例：活性化している筋量、心拍数の自律神経制御など）から問題があるため、強度は主観的運動強度（RPE）により測定する。','脊髄損傷のクライアントのためのエクササイズガイドラインについて誤っているものを選びなさい。',22),(22001,'e→d→c→a→b','a→e→d→c→b','d→e→a→b→c','b→c→a→e→d','C','筋肥大期→筋力期→筋力／パワー期→試合・ピーキング期→積極的休養期','ピリオダイゼーションプログラムの各期を正しい順番で並べたものを選びなさい。\r\na.筋力／パワー期\r\nb.試合・ピーキング期\r\nc.積極的休養期\r\nd.筋肥大期\r\ne.筋力期',23),(23001,'車椅子での通行に支障がないよう、出入り口の幅は48インチ（122 cm）以上でなければならない。','施設内のAEDは、緊急事態の発生が想定される場所から歩いて3分以内のところに設置しなければならない。','環境騒音レベルを70デシベル以下に保ち、90デシベルを超えないようにするのが望ましい。','ストレングス&コンディショニング施設での推奨温度は、64～68℉（18～20℃）である。','C','A.出入り口の幅は36インチ（91 cm）以上でなければならない。\r\nB.歩いて1分半以内のところに設置しなければならない。\r\nD.推奨温度は72～78℉（22～26℃）である。68～72℉（20～22℃）を適温とする報告もある。','フィットネス施設のガイドラインについて正しいものを選びなさい。',24),(24001,'性別、人種、宗教、国籍、年齢による差別はこれを禁じる。すべてのクライアントは等しく扱われ、その秘密は保護されねばならない。','パーソナルトレーナーは、関連のある連邦法、州法、および地方の法令を遵守し、同時に、所属する組織のすべてのガイドラインとNSCAの規定、方針、手順に従わなければならない。','パーソナルトレーナーは、自分の技術、トレーニング、あるいは認定資格を偽ってはならない。また場合によっては、資格により認定されたサービス以上のものを提供してもよい。','パーソナルトレーナーは、専門職としても個人としても、NSCAに悪影響を及ぼすいかなる行為も行ってはならない。例えば、クライアントの健康よりも自身の金銭的利益を決して優先させるべきではない。また禁止薬物の乱用は絶対に避けなければならない。','C','Cが誤り。パーソナルトレーナーは資格により認定されたサービスだけを提供しなければならない。','NSCAの倫理規定について誤っているものを選びなさい。',25),(1002,'大動脈','大静脈','肺動脈','肺静脈','D','肺で酸素を取り入れた後の動脈血が流れる血管を肺静脈という。','血液中の酸素濃度が最も大きい動脈または静脈を選びなさい。',2),(1003,'心臓の電気伝達系は、心臓に本来備わったペースメーカーともいうべき洞房結節（SA結節）から始まる。','心臓は横紋筋である心筋でつくられた器官である。','心臓は不随意神経により制御されており、脳からの命令で収縮する。','電気的インパルスが生じてから心室が収縮するまでに要する時間は、約0.2秒である。','C','Cが誤り。心臓は不随意神経により制御されており、自律的に収縮する。\r\nD.電気的インパルスの発生から心室収縮までの流れは次のようになっている。「洞房結節（SA結節）→房室結節（AV結節）→プルキンエ線維→心室収縮」','心臓について誤っているものを選びなさい。',2),(2002,'ホスファゲン機構は高強度の運動時のみに動員される機構である。','クレアチンキナーゼはクレアチンリン酸とADPからATPを再合成する速度を速めるが、この過程でクレアチンリン酸は、ADPにリン酸基を供給することによってATPを産生する。','ミオシンATPアーゼはATPをADPと無機リン酸（Pi）に分解する速度を速め、エネルギーを放出する。','ホスファゲン機構は短時間で高強度の身体活動のためのATPの主要な供給源であり、タイプⅡ（速筋）線維はタイプⅠ（遅筋）線維より多くのホスファゲンを含んでいる。','A','Aが誤り。ホスファゲン機構は強度にかかわらずすべての運動の開始時にも動員される機構である。','ホスファゲン機構について誤っているものを選びなさい。',3),(2003,'乳酸は糖新生に使われ、長時間の運動とその回復期間に、グルコースがつくられる。','解糖系は筋に蓄えられたグリコーゲンあるいは血中に運ばれたアミノ酸を分解し、ATPを産生する。','解糖系では、グルコース1分子から2分子のATPが産生されるが、グリコーゲンが使われる場合には3ATPが産生される。','速い解糖は筋細胞における酸素の利用が減退したときに起こり、最終的には乳酸が生成される。','B','Bが誤り。解糖系は筋に蓄えられたグリコーゲンあるいは血中に運ばれたグルコースといった炭水化物を分解し、ATPを産生する。','解糖系について誤っているものを選びなさい。',3),(3002,'バイセップスカール','レッグエクステンション','ショルダープレス','ベントオーバーラテラルレイズ','D','A.バイセップスカール：矢状面、B.レッグエクステンション：矢状面、C.ショルダープレス：前額面、D.ベントオーバーラテラルレイズ：水平面','水平面上の動作をするエクササイズを選びなさい。',4),(3003,'シットアップ','アダクションマシーン','ラットプルダウン','ラテラルレイズ','A','A.シットアップ：矢状面、B.アダクションマシーン：水平面、C.ラットプルダウン：前額面、D.ラテラルレイズ：前額面','矢状面上の動作をするエクササイズを選びなさい。',4),(4002,'遅い筋活動時は主に遅筋線維を支配する運動単位が動員される。','ボディビルディングタイプのレジスタンストレーニングにおけるATP産生の80 %以上は解糖によるものと推定されている。そのため、レジスタンストレーニングを行うクライアントは食事で十分な糖質を摂取する必要がある。','筋力の調節は、運動単位の動員と発火頻度の調節という2つの要因の相互作用によって行われる。','力発揮のための運動単位の動員は、サイズの原理に従う。これは小さな力を発揮する際には小さな運動単位が、大きな力を発揮する際には大きな運動単位が動員されるということである。','A','Aが誤り。運動単位の動員様式はサイズの原理に従い、エクササイズに必要な発揮筋力に基づいているため、たとえ遅い筋活動であっても必要とされる力が十分に大きければ速筋繊維は動員される。','レジスタンストレーニングに対する短期的適応について誤っているものを選びなさい。',5),(4003,'筋力','共収縮','除脂肪量','運動単位の発火頻度','B','A.筋力：増加、B.共収縮：減少、C.除脂肪量：増加、D.運動単位の発火頻度：増加','レジスタンストレーニングに対する長期的適応について、減少するものを選びなさい。',5),(5002,'1回拍出量','心拍数','収縮期血圧','酸素消費量','A','A.1回拍出量：増加、B.心拍数：減少、C.収縮期血圧：低下、D.酸素消費量：変化なし','有酸素性持久力トレーニングに対する安静時の心肺系と代謝系の長期的適応について、増加するものを選びなさい。',6),(5003,'除脂肪量','ミトコンドリア密度','タイプⅡ線維の横断面積','筋力','B','A.除脂肪量：変化なし、B.ミトコンドリア密度：増加、C.タイプⅡ線維の横断面積：変化なし、D.筋力：変化なし','有酸素性持久力トレーニングに対する長期的適応について、増加するものを選びなさい。',6),(6002,'成人のエネルギー必要量を構成するのは、安静時代謝率、身体活動、食事誘発性熱産生の3つの要素である。','安静時代謝率は、呼吸、心機能、体温調節などの正常な身体機能を維持するために必要なカロリーの量であり、いわば1日中何もせずにベッドに横になっていても消費するエネルギーのことである。','身体活動は、すべての構成要素の中で最も変動が大きく、また総エネルギー必要量の要素の中で最も大きい割合を占める。','食事誘発性熱産生は、食後数時間にわたってエネルギー消費量が増加する現象である。','C','Cが誤り。身体活動は2番目に大きな要素。最も大きいのは安静時代謝率。','エネルギー必要量について誤っているものを選びなさい。',7),(6003,'タンパク質の推奨量は、身体活動レベルの低い健康な成人男女で、1日に体重1 kg当たり0.8 gとされている。','クライアントに腎機能障害、カルシウム摂取不足、水分の摂取制限などがある場合には、健康な人より多くのタンパク質摂取が必要となる。','アスリートの一般的な1日のタンパク質推奨摂取量は、体重1 kg当たり1.2～2.0 gとされている。','タンパク質はアミノ酸で構成される。','B','クライアントに腎機能障害、カルシウム摂取不足、水分の摂取制限などがある場合には、タンパク質の過剰摂取（1日に体重1 kg当たり4 g以上）に注意しなければならない。','タンパク質について誤っているものを選びなさい。',7),(7002,'試合で友人よりも速く走りたい。','1か月で体重を2 kg落としたい。','3か月後にベンチプレスで70 kgの重量を挙げたい。','毎日最低10分有酸素運動を行う。','A','A.成果目標、B.パフォーマンス目標、C.パフォーマンス目標、D.過程目標','成果目標の具体例として正しいものを選びなさい。',8),(7003,'正の強化','負の強化','正の罰','負の罰','B','例.目標を達成したクライアントに対して、普段行っているマシンの清掃作業を免除する。','ある行動に対する報酬（報奨）として嫌なことが取り除かれることを何というか。',8),(8002,'喫煙：喫煙者と禁煙後6か月以内の元喫煙者、または受動喫煙者。','脂質異常症：LDLコレステロール値≧130 mg/dlまたはHDLコレステロール値＜40 mg/dl、または脂質低下薬の服用。総コレステロール値しか測定されていない場合は200 mg/dlを使用。','糖尿病前症：空腹時血糖異常 = 空腹時血漿グルコース≧100 mg/dlただし＜126 mg/dl、または耐糖能異常 = 経口グルコース負荷試験の2時間後の値≧140 mg/dlただし＜200 mg/dl（少なくとも、日を置いて2回測定）。','非活動的な生活習慣：少なくとも週3日、1日30分以上の中強度の身体活動（40～60 % VO2R）を1か月以上行っていない。','D','Dが誤り。少なくとも週3日、1日30分以上の中強度の身体活動（40～60 % VO2R）を3か月以上行っていない。','冠状動脈疾患の陽性の危険因子について誤っているものを選びなさい。',9),(8003,'心雑音の所見','50歳以前に突然死または不測死した親族が1人以上いる家族歴','身体活動時に起こる原因不明のめまいや失神','エクササイズに伴う過度の、または原因不明の息切れや疲労','B','Bが誤り。正しくは、50歳以前に突然死または不測死した親族が2人以上いる家族歴。','次の症状が1つ以上当てはまるクライアントは心臓突然死の危険性があり、心臓血管系専門医による診断が必要とされる。その症状として誤っているものを選びなさい。',9),(9002,'d→a→e→b→c','c→e→d→a→b','c→b→e→a→d','e→a→d→b→c','C','テスト手順の作成においては、正確な結果を得るために、パーソナルトレーナーは最適なパフォーマンスと適切な休息と回復時間を確保できるテストの順序を理解して決定しなければならない。','一般的体力を評価する際に、最も正確な結果が期待できるテストの実施順序を選びなさい。\r\na.局所筋持久力テスト\r\nb.非疲労性テスト\r\nc.安静時テスト\r\nd.最大化の有酸素性能力テスト\r\ne.筋力テスト',10),(9003,'Tテスト','1分間シットアップテスト','40ヤード（37 m）スプリント','垂直跳び','C','最適な順序は、D→A→C→Bである。','選択肢A～Dの体力テストを全て実施する場合、3番目に実施すべきテストを選びなさい。',10),(10002,'運動後30分以内に行う。','キャリパーの「あご」を、つまんだ皮膚に対して垂直に、親指と人差し指から1 cm離して当てて、ゆっくりとキャリパーの圧をかける。','各部位で最低2回の計測を行う。2 mmあるいは10 %以上の誤差があったら、再度測定を行う。','すべての皮脂厚測定は身体の右側で行う。','A','Aが誤り。クライアントの皮膚が乾燥し、ローションなどがついていないときに測定する。加えて、運動前に行うべきである。運動を行うと身体組織の水分状態が変わってしまい、それが皮脂厚に影響する。','皮脂厚測定に関する留意点として誤っているものを選びなさい。',11),(10003,'腋窩','胸部','腹部','大腿部','B','男性では腋窩前線（腋窩前方から下方へ延ばした想像上の線）と乳頭の中間の位置を、女性では腋窩前線と乳頭の距離の1/3の位置を、斜めにつまむ。','皮脂厚の測定部位について斜めにつまむものを選びなさい。',11),(11002,'ランジウォーク','サイクリング','縄跳び','ジョギング','A','Aが誤り。ランジウォークは動的柔軟性エクササイズである。','ウォームアップとして誤っているものを選びなさい。',12),(11003,'静的ストレッチング','一般的ウォームアップ','専門的ウォームアップ','固有受容性神経筋促通法（PNF）','C','専門的ウォームアップとは、ランニング前にゆっくりとしたジョギングを行うことや、ベンチプレスでメインセットの重量に負荷を上げる前に軽い重量でのセットを行うといった、各活動における実際の動作を含むものである。','競技パフォーマンスに最も効果的な運動前の活動を選びなさい。',12),(12002,'プッシュプレス','アームカール','ベンチプレス','ラットプルダウン','A','ストラクチュラルエクササイズとは、脊柱にストレスがかかるエクササイズである。','ストラクチュラルエクササイズを選びなさい。',13),(12003,'スクワット','ショルダープレス','デッドリフト','ベンチプレス','D','Dが誤り。バルサルバ法を用いてもよいエクササイズは、ストラクチュラルエクササイズまたは下背部にストレスがかかるようなエクササイズである。ただし、心肺機能、代謝、呼吸器等の既往症があるか、または何らかの疾患があると疑われるクライアントに対しては、レジスタンストレーニング中に息を止めることを認めるべきではない。','バルサルバ法を用いてもよいエクササイズとして誤っているものを選びなさい。',13),(13002,'トレッドミルの傾斜角度を0 %に設定する。','両足を広げてベルトをまたぎ、ハンドレールにつかまる。','ベルトに乗り、ハンドレールにつかまる。','ベルトに乗り、ハンドレールから手を離す。','B','ベルトをまたいだ状態でトレッドミルを始動して、スピードを1.0マイル（約1.6 km）/時にセットする。ベルトが動いている状態で、まず片足をベルトに乗せ、次にもう一方の足を乗せて歩行を開始する。','トレッドミルの使用開始前の姿勢・状態について正しいものを選びなさい。',14),(13003,'スピードを2 %上げる。','スピードを10 %上げる。','傾斜角度を1°に設定する。','傾斜角度を5°に設定する。','C','トレッドミルの傾斜角度を1°に設定する。','トレッドミルランニングは空気抵抗がなく、同じスピードによる屋外ランニングよりもエネルギー消費が少ない。この違いを解消するためにはどうすべきか正しいものを選びなさい。',14),(14003,'ペックデック','トライセップスプッシュダウン','レッグカール','パワークリーン','D','A、B、Cは補助エクササイズである。','コアエクササイズを選びなさい。',15),(15002,'インターバルトレーニング','サーキットトレーニング','クロストレーニング','ペース／テンポトレーニング','D','ペース／テンポトレーニングのセッションは一般に20～30分続き、クライアントには乳酸性作業閾値での運動を行うことが求められる。ワークアウトは、間欠的にも持続的にも行われる。','心肺機能の持久力を向上させたいと望んでいるクライアントや、心拍数範囲の最も高いレベルでのエクササイズ実施が可能なクライアントが最大酸素摂取量（VO2max）を向上させるのに役立つトレーニングを選びなさい。',16),(15003,'ロングスローディスタンストレーニング','インターバルトレーニング','クロストレーニング','サーキットトレーニング','D','心肺機能の持久力向上と同時に筋持久力の向上を引き起こそうというものであるが、残念ながら最大酸素摂取量（VO2max）を有意に向上させることはないとされている。したがって、維持プログラムやトレーニング時間が限られている際に取り入れるとよいとされている。','有酸素性持久力トレーニングとレジスタンストレーニングを組み合わせたものを選びなさい。',16),(17002,'高齢者は1週間のうちで連続しない2～3日においてレジスタンストレーニングを実施すべきである。','50歳以上の成人は、1年間で約0.22 kgの筋量が減少することが明らかになっている。','高齢者に対する有酸素性持久力トレーニングの適切な頻度と時間は、1週間に2～5日、1回当たり20～60分間が推奨される。','高齢者に対する有酸素性持久力トレーニングの適切な運動強度は、最大心拍数の60～90 %であり、一般的には約75 %が設定される。','B','Bが誤り。30～40代の成人は1年間で約0.22 kg、50歳以上は約0.45 kgの筋量が減少することが明らかになっている。','高齢者のトレーニングについて誤っているものを選びなさい。',18),(17003,'シットアップ','シーティッドチェストプレス','ラットプルダウン','ステーショナリーバイク','A','妊娠3か月以降は仰臥位でのエクササイズは止める。','妊婦のエクササイズについて、妊娠3か月以降は避けるべきトレーニングを選びなさい。',18),(18002,'エクササイズを始めたはかりの体重過多や肥満のクライアントには、中強度の身体活動を少なくとも30分間、ほぼ毎日行うことが勧められる。中強度の身体活動とは、1日におよそ150 kcal、1週間でおよそ1,000 kcalを消費する活動と定義される。','減量プログラムの最初の合理的な目標は、6か月かけて体重の10 %を減量することである。','1週間当たり1～2ポンド（0.45～0.9 kg）の減量を容易にするためには、1日当たり500～1,000 kcalの不足が起こるように、食事を個別に計画することが推奨されている。','肥満の人々における体重減少の多くは、主として運動を増やすことによって起こる。','D','Dが誤り。肥満の人々における体重減少の多くは、主として摂取カロリーを少なくすることによって起こる。','肥満のための生活習慣変容プログラムについて誤っているものを選びなさい。',19),(18003,'糖質：総エネルギー量の20～30 %','脂質：総エネルギー量の25～35 %以下','タンパク質：総エネルギー量の約15 %','食物繊維：1日20～30 g','A','Aが誤り。糖質の推奨摂取量は総エネルギー量の50～60 %である。','TLC食の各栄養素の推奨摂取量について誤っているものを選びなさい。',19),(19002,'レジスタンストレーニング初期の休息時間として、セット間に完全回復を促すために2～3分間（あるいはそれ以上）は取るべきである。','血圧がステージ2以上であれば、絶対にエクササイズは行わず、まずは担当医に相談するようクライアントにアドバイスをする。','有酸素性の各エクササイズは15～30分間の連続的なもので、目標は30～60分間を連続的に実施することである。','有酸素性トレーニングの運動強度は最大酸素摂取量（VO2max）の40～50 %から開始する。','B','Bが誤り。血圧がステージ1以上であれば、絶対にエクササイズは行わず、まずは担当医に相談するようクライアントにアドバイスをする。','高血圧のクライアントのためのエクササイズガイドラインについて誤っているものを選びなさい。',20),(21002,'熱に対する感受性が高く、暑熱や寒冷による傷害の危険性が高いため、適切な水分補給と温度管理のなされた環境でエクササイズを行うことを強調する必要がある。','感覚麻痺によりバーをしっかりと握れず、フリーウェイトのエクササイズなどは行うことができないため、他のエクササイズに変更する必要がある。','特に症状が進んでいるクライアントの場合、歩行中のエネルギー消費は健常者の1.5倍となるため、最大心拍数の60～75 %に負荷を調節する必要がある。','レジスタンストレーニングは、疲労を避けるために、持久力トレーニングを行わない日に実施しなければならない。','C','Cが誤り。特に症状が進んでいるクライアントの場合、歩行中のエネルギー消費は健常者の2～3倍となる。','多発性硬化症のクライアントのためのエクササイズガイドラインについて誤っているものを選びなさい。',22),(22002,'スクワット','ラットプルダウン','トライセップスエクステンション','レッグカール','C','トライセップスエクステンションは肘関節を伸展させる上腕三頭筋を主に鍛えるエクササイズである。','野球投手にとって有効な、スポーツに特異的なレジスタンスエクササイズを選びなさい。',23),(23002,'フィットネススタッフとクライアントの推奨比率は約1 : 10である。','鏡は床から20インチ（51 cm）以上の高さに設置し、器具は鏡から6インチ（15 cm）以上離して設置する。','窓は床から40インチ（102 cm）以上の高さに設置する。','天井の高さは12～14フィート（3.7～4.3 m）が望ましい。','C','Cが誤り。窓は床から20インチ（51 cm）以上の高さに設置する。','レジスタンストレーニングルームのガイドラインについて誤っているものを選びなさい。',24),(24002,'心肺蘇生法（CPR）や自動体外式除細動器（AED）を提供しなかったことや提供方法の欠陥。','痛みを訴えるクライアントに薬を提供しなかったこと。','危険の引き受けの承諾書、権利放棄所、または免責同意書の不適切な使用。','活動開始前のクライアントのスクリーニング、評価、またはテストの不履行。','B','Bが誤り。このような場合は医療専門職へ照会する。','パーソナルトレーナーに対する賠償請求の内容として誤っているものを選びなさい。',25);
/*!40000 ALTER TABLE `exercises` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `parts`
--

DROP TABLE IF EXISTS `parts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `parts` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parts`
--

LOCK TABLES `parts` WRITE;
/*!40000 ALTER TABLE `parts` DISABLE KEYS */;
INSERT INTO `parts` VALUES (1,'エクササイズサイエンス'),(2,'初回面談と評価'),(3,'エクササイズテクニック'),(4,'プログラムデザイン'),(5,'特定のクライアント向けに'),(6,'安全性と法的問題');
/*!40000 ALTER TABLE `parts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_flag` int(11) NOT NULL,
  `nickname` varchar(255) NOT NULL,
  `password` varchar(64) NOT NULL,
  `user_id` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_6efs5vmce86ymf5q7lmvn2uuf` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,1,'管理者','83B219A2D46EAE9FBA059885DB44DD04F2C671524BA6204917E242B4C73AC827','azukied'),(2,0,'a','D0C940B89AD319FC9CBF3A59D084942FC5E3D91C9A88ED382A7DC174A44DE67B','a'),(3,0,'b','657F135E53548F9A6E2E7BAF25193E00E496FE9E5653E7C4B4D4C585577F81B5','b'),(6,0,'d','BA66CBCD5A1479093C7420B7A3AC2E2929392A1688D084ACC7EFD97FF8D5968D','d'),(5,0,'c','17899B123390D471FFAD501D8FE79FA490F97134C282E0174107DDDBED783A27','c'),(7,0,'e','4E949E46B5110C3871261C7754E342BC2622DDBE7676EE9B295230D16264D4D1','e'),(8,0,'f','68E6D5BA8BAE16BFF3C0F05406957358DA04ADF16958D5F64BC7283E399CEFD8','f');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-12-21  2:47:10
