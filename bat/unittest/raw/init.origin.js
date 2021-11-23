/*================================================================
**
**  Nodejs初期化ファイル
**  ※必ず、Nodejsファイルの頭でインクルードすること。
================================================================*/

/*================================================================
**
**  データベース
**
================================================================*/
module.exports.E_ERROR = 1;
module.exports.E_NOTICE = 8; 
module.exports.E_WARNING = 2;
module.exports.E_USER_ERROR = 256;    // error when using trigger error - error
module.exports.E_USER_NOTICE = 1024;  // error when using trigger error - notice
module.exports.E_USER_WARNING = 512;  // error when using trigger error - warning

//情報公開ルートホスト名
module.exports.JT_HOSTNAME = "{JT_HOSTNAME}";
// データベース
module.exports.DATABASE = "HSMJT";
// ユーザ名
module.exports.USERNAME = "SYSDBA";
// パスワード
module.exports.PASSWORD = "marskey";

/* レプリケーション */
module.exports.JT_HOSTNAME_REP = "199.22.206.29";
module.exports.DATABASE_REP = "F:\\HSMJTOTH.FDB";
module.exports.USERNAME_REP = "SYSDBA";
module.exports.PASSWORD_REP = "marskey";

// バックアップフォルダ
module.exports.FDB_BACKUP_PATH = "C:\\backup\\Jt\\db";

/*================================================================
**
**  データベース (Oracle)
**
================================================================*/
//Oracleサーバ名
module.exports.JT_ORA_HOSTNAME = "{HC_HOSTNAME}";
// データベース
module.exports.ORA_DATABASE = "PRODB.DACNET";
// ユーザ名
module.exports.ORA_USERNAME = "mars";
// パスワード
module.exports.ORA_PASSWORD = "mars";
// 使用するポート番号
module.exports.ORA_PORT = "1521";
// Oracle側の文字コード
module.exports.ORA_CHAR_SET = "SJIS";

/*================================================================
**
**  FSX8000
**
================================================================*/
// FSXのデータパス(コンバートPGからの相対パス)
module.exports.PATH_FSX8000 = "//{HC_HOSTNAME}/FSX8800/";
// 配置設定ファイル名
module.exports.FILE_HAITI = "haiti.dat";
// HV用データファイル名
module.exports.FILE_HV = "hv.dat";
// HV用５分スランプファイル名
module.exports.FILE_HV_MIN = "hv_min.dat";
// 特賞大当り履歴ファイル名
module.exports.FILE_OOATARI = "ooatari.dat";
// 特賞大当り履歴ファイル名
module.exports.FILE_OOATAEI_IDX = "ooatari.inf";

/*================================================================
**
**  DAC-800Z/D
**
================================================================*/
//ポート番号
module.exports.ZDT_PORT = {ZDT_PORT};
// コマンドラインアプリケーション(ZDTCLIENT)
module.exports.ZDT_COMMAND = "C:\\ZDTRANS\\ZDTCLIENT";
//特賞データ格納ホスト		ADD '06.09.15 H.Kondo
module.exports.ZD_TOKUSHO_HOSTNAME = "{ZD_TOKUSHO_HOSTNAME}";
//特賞データ格納フォルダ	ADD '06.09.15 H.Kondo
module.exports.ZD_TOKUSHO_DIR = "{ZD_TOKUSHO_DIR}";

/*================================================================
**
**  タムス出力データファイル (CSV)
**
================================================================*/
// 出力データファイルパス
module.exports.JT_CSV_PATH = "C:\\INFO_DATA\\DAI_DATA";
// 出力データファイルバックアップパス
module.exports.JT_CSV_BACKUP_PATH = module.exports.JT_CSV_PATH.concat("\\".concat("backup"));
// 出力データファイル名
module.exports.JT_CSV_FILENAME = "HCDATA.CSV";
// 出力データファイルオープンリトライ回数
module.exports.JT_CSV_RETRY = 10;
// 出力データファイルオープンリトライ間隔（秒）
module.exports.JT_CSV_RETRY_TIME = 10;

/*================================================================
**
**  E-Navi
**
================================================================*/
// FTPユーザ名
module.exports.KITAC_USER = "kitac";
// FTPパスワード
module.exports.KITAC_PASSWD = "kitac";
// FTPパス
module.exports.KITAC_PATH = "/DB";
// CSVファイル更新インターバル
module.exports.KITAC_CSV_INTERVAL = 10;
// MDBファイル更新インターバル
module.exports.KITAC_MDB_INTERVAL = 10;
// MDBファイルタイトル
module.exports.KITAC_MDB_TITLE = "PD_PMS";
// MDBファイル拡張子
module.exports.KITAC_MDB_EXT = ".MDB";
// CSVファイル名
module.exports.KITAC_CSV_NAME = "PC_DAI.CSV";

/*================================================================
**
**  メイン親機のデータベース
**
================================================================*/
//情報公開メイン親機ホスト名
module.exports.MAIN_HOSTNAME = "{MAIN_HOSTNAME}";
// データベース
module.exports.MAIN_DATABASE = "HSMJTCOM";
// ユーザ名
module.exports.MAIN_USERNAME = "SYSDBA";
// パスワード
module.exports.MAIN_PASSWORD = "marskey";

/*================================================================
**
**  ホールコンピュータのデータベース
**
================================================================*/
//サーバー名
module.exports.HC_HOSTNAME = "{HC_HOSTNAME}";
// データベース
module.exports.HC_DATABASE = "HSMWKGDB";
// ユーザ名
module.exports.HC_USERNAME = "MARS";
// パスワード
module.exports.HC_PASSWORD = "mars";
// ホールコンピュータタイプ
module.exports.HC_TYPE_M7 =              1;
module.exports.HC_TYPE_DAC800PRO =       2;
module.exports.HC_TYPE_FSX8800 =         3;
module.exports.HC_TYPE_DAC800ZV1 =       4;
module.exports.HC_TYPE_DAC800ZV2 =       5;
module.exports.HC_TYPE_TAMS =            6;
module.exports.HC_TYPE_DAC800PROZ =      7;
module.exports.HC_TYPE_ENAVI =           8;
module.exports.HC_TYPE_IMS_M7 =          9;
module.exports.HC_TYPE = {HC_TYPE};

module.exports.UPLOAD_DIR = "../img_staff";

/*================================================================
**
**  データベース (ホールコンテンツサーバ)
**
================================================================*/
//ホールコンテンツサーバホスト名
module.exports.HCS_HOSTNAME = "{HCS_HOSTNAME}";
// データベース
module.exports.HCS_DATABASE = "MIPS";
// ユーザ名
module.exports.HCS_USERNAME = "MIPSUSER";
// パスワード
module.exports.HCS_PASSWORD = "mars";

/*================================================================
**
**  通信設定ファイル
**
================================================================*/
//
module.exports.JT_ROOT = "C:/JT";
module.exports.JT_BIN_DIR = module.exports.JT_ROOT.concat("/bin");
module.exports.JTSETTINGFILE = module.exports.JT_BIN_DIR.concat("/JTSetting.ini");
module.exports.CARDAUTHFILE = module.exports.JT_BIN_DIR.concat("/CardAuth.dat");
module.exports.TCPMANAGEFILE = module.exports.JT_BIN_DIR.concat("/TcpManage.ini");
module.exports.RTN_CODE = "\r\n";
module.exports.JT_CNF_DIR = module.exports.JT_ROOT.concat("/conf");
module.exports.JTCHILDLSTFILE = module.exports.JT_CNF_DIR.concat("/jt_child.lst");
module.exports.JTCHILDWOLFILE = module.exports.JT_CNF_DIR.concat("/jt_child.wol");
module.exports.LOCALSETTINGFILE = module.exports.JT_CNF_DIR.concat("/localSetting.xml");   // ローカル通信設定ファイル ADD '09.02.06 H.Kondo

/*================================================================
**
**  環境設定ファイル
**
================================================================*/
module.exports.JT_INI_DIR = module.exports.JT_ROOT.concat("/ini");
module.exports.SCREENSAVERFILE = module.exports.JT_INI_DIR.concat("/Screensaver.txt");
module.exports.STAFFINRODUCTFILE = module.exports.JT_INI_DIR.concat("/StaffIntroduct.txt");
module.exports.STAFFRANKINGFILE = module.exports.JT_INI_DIR.concat("/StaffRanking.txt");
module.exports.STAFFRANKINGTOP3FILE = module.exports.JT_INI_DIR.concat("/StaffRanking_top3.txt");
module.exports.USERSCROLLMSGFILE = module.exports.JT_INI_DIR.concat("/UserScrollMsg.txt");
module.exports.PLAYMODEMSGFILE = module.exports.JT_INI_DIR.concat("/PlayModeMsg.txt");
module.exports.STAFF_DISPITEM_INTRODUCT = 1;
module.exports.STAFF_DISPITEM_RANKING = 2;
module.exports.STAFF_DISPITEM_RANKING_TOP3 = 3;

module.exports.APP_ROOT = "C:/inetpub/wwwroot";
module.exports.APP_CONF_DIR = module.exports.APP_ROOT.concat("/conf");
module.exports.APP_BIN_DIR = module.exports.APP_ROOT.concat("/bin");
module.exports.INIXMLFILE = module.exports.APP_CONF_DIR.concat("/ini.xml");
module.exports.APP_IMG_MAP_DIR = module.exports.APP_ROOT.concat("/img_map");
module.exports.APP_IMG_STAFF_DIR = module.exports.APP_ROOT.concat("/img_staff");
module.exports.ENVSETTINGFILE = module.exports.APP_BIN_DIR.concat("/env.dat");			    // 環境変数設定ファイル	ADD '06.02.16 H.Kondo
module.exports.JTUPLOADEXE = module.exports.JT_BIN_DIR.concat("/JTUpload.exe");
module.exports.JTSETTINGEXE = module.exports.JT_BIN_DIR.concat("/JTSetting.exe");
module.exports.GETMACADDREXE = module.exports.JT_BIN_DIR.concat("/GetMacAddr.exe");
module.exports.ACCESSHYPER = module.exports.JT_BIN_DIR.concat("/JTHyperAccess.exe");
module.exports.ENVSETEXE = module.exports.APP_BIN_DIR.concat("/environment.wsf");		    // 環境変数設定ツール	ADD '06.02.16 H.Kondo
module.exports.FTP_ROOT = "C:/inetpub/ftproot";
module.exports.CHGENVBAT = module.exports.APP_ROOT.concat("/bat/ChangeEnvironment.bat");	// 環境切り替えバッチ	ADD '06.03.28 H.Kondo

// コンバートログ出力先
module.exports.CNV_LOG_PATH = module.exports.APP_ROOT.concat("/logs/JTDBTransfer.log");

/*================================================================
**
**  ログファイル
**
================================================================*/
module.exports.LOGFILE = module.exports.APP_ROOT.concat("/logs/jotan.log");

/*================================================================
**
**  FTP設定
**
================================================================*/
// FTPサーバ・ポート・タイムアウト
module.exports.FTP_SERVER = "{HCFTP_SERVER}";
module.exports.FTP_PORT = 21;
module.exports.FTP_TIMEOUT = 15;

// FTP ユーザ・パスワード
module.exports.FTP_USER = "mars";
module.exports.FTP_PASSWD = "marsadmin";

// FTPパス（マスタファイル）
module.exports.FTP_MASTERFILE_DIR = "/INFO_DATA/MASTER_DATA2";

// FTPパス（定刻）
module.exports.FTP_SCHEDULE_DIR = "/INFO_DATA/SCHEDULED_DATA";

// ローカルディレクトリ
module.exports.FTP_LOCAL_DIR = "C:/INFO_DATA";

// ローカルディレクトリ（マスタファイル）
module.exports.FTP_LOCAL_MASTERFILE_DIR = module.exports.FTP_LOCAL_DIR.concat("/MASTER_DATA2");

// ローカルディレクトリ（定刻ファイル）
module.exports.FTP_LOCAL_SCHEDULEFILE_DIR = module.exports.FTP_LOCAL_DIR.concat("/SCHEDULED_DATA");

// 定刻データファイル名(パチンコ）
module.exports.FTP_LOCAL_SCHEDULEFILE_FILE_P = "TEIKOKU_P.xml";

// 定刻データファイル名(スロット）
module.exports.FTP_LOCAL_SCHEDULEFILE_FILE_S = "TEIKOKU_S.xml";

// 転送モード
// module.exports.FTP_TRANSMIT = FTP_BINARY;

// コネクト失敗時ウエイト時間
module.exports.FTP_RETRY_WAIT_TIME = 10;

// コネクト失敗リトライ回数
module.exports.FTP_RETRY_COUNT = 10;

module.exports.UPLOAD_DIR = "../img_staff";

// ホールイメージツールディレクトリ
module.exports.IMG_TOOL_DIR        = "../img_maptool/";
// ホールマップ出力ディレクトリ
module.exports.IMG_MAP_DIR         = "../img_map/";
// ホールマップ名
module.exports.HOLE_MAP_NAME       = "holeMap.png";
// サブマップタイトル
module.exports.SUB_MAP_FILE_TITLE  = "submap_";
// サブマップ拡張子
module.exports.SUB_MAP_FILE_EXT    = ".png";

// MACアドレス取得用JS
module.exports.MAC_ADDR_JS = "/api/v1/GetMacAddress";

// 環境切り替えバッチ	ADD '06.03.28 H.Kondo
module.exports.CHG_ENV_JS = "/api/v1/ChangeEnvironment";

// ハイパーへのアクセス
module.exports.HYPER_ACCESS = {USE_HYPER};

/*================================================================
**
**  エラーハンドラの設定
**  ※編集
================================================================*/

module.exports.error_handler = function($errno, $errmsg, $file, $line)
{
    switch ($errno)
    {
        case module.exports.E_USER_ERROR:
            log_write( "ERROR", $errno, $errmsg, $file, $line);
            break;
        case module.exports.E_USER_NOTICE:
            log_write( "NOTICE", $errno, $errmsg, $file, $line);
            break;
        case module.exports.E_USER_WARNING:
            log_write( "WARNING", $errno, $errmsg, $file, $line);
            break;
        default:
            log_write( "ALERT", $errno, $errmsg, $file, $line);
            break;
    }
}

function getCurrentDateString(){
    var date = new Date();
    var month = (date.getMonth() + 1).toString();
    var day = date.getDate().toString();
    var hour = date.getHours().toString();
    var minute = date.getMinutes().toString();
    var second = date.getSeconds().toString();
    if(month.length < 2){
        month = "0" + month;
    }
    if(day.length < 2){
        day = "0" + day;
    }
    if(hour.length < 2){
        hour = "0" + hour;
    }
    if(minute.length < 2){
        minute = "0" + minute;
    }
    if(second.length < 2){
        second = "0" + second;
    }
    var date_time_str = date.getFullYear().toString() + "/" + month + "/" + day + " " + hour + ":" + minute + ":" + second;
    return date_time_str;
}

/*================================================================
**
**  ログ出力
**
================================================================*/
function log_write( $type, $errno, $errmsg, $file, $line){
    var date_time_str = getCurrentDateString();
    var fs = require('fs');
    var dir = module.exports.APP_ROOT.concat('/logs');
    if (!fs.existsSync(dir)){
        fs.mkdirSync(dir, { recursive: true });
    }
    fs.appendFile(module.exports.LOGFILE, date_time_str.concat(" ", $type, "@", $file, ":", $line, "\t[", $errno, "]", $errmsg, "\n"), function(error){
        if(error){
            console.log(error);
        }
    });
}