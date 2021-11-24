<?php
    /*================================================================
    **
    **  PHP初期化ファイル
    **  ※必ず、PHPファイルの頭でインクルードすること。
    ================================================================*/

    /*================================================================
    **
    **  データベース
    **
    ================================================================*/
    //情報公開ルートホスト名
    define("JT_HOSTNAME", "127.0.0.1");
    // データベース
    define("DATABASE", JT_HOSTNAME.":HSMJT");
    // ユーザ名
    define("USERNAME", "SYSDBA");
    // パスワード
    define("PASSWORD", "marskey");

    /* レプリケーション */
    define("JT_HOSTNAME_REP", "199.22.206.29");
    define("DATABASE_REP", JT_HOSTNAME_REP.":F:\\HSMJTOTH.FDB");
    define("USERNAME_REP", "SYSDBA");
    define("PASSWORD_REP", "marskey");

    // バックアップフォルダ
    define("FDB_BACKUP_PATH","C:\\backup\\Jt\\db");

    // コンバートログ出力先
    define("CNV_LOG_PATH","C:\\InetPub\\wwwroot\\PHP\\logs\\JTDBTransfer.log");

    /*================================================================
    **
    **  データベース (Oracle)
    **
    ================================================================*/
    //Oracleサーバ名
    define("JT_ORA_HOSTNAME", "127.0.0.1");
    // データベース
    define("ORA_DATABASE", "PRODB.DACNET");
    // ユーザ名
    define("ORA_USERNAME", "mars");
    // パスワード
    define("ORA_PASSWORD", "mars");
    // 使用するポート番号
    define("ORA_PORT","1521");
    // Oracle側の文字コード
    define("ORA_CHAR_SET","SJIS");

    /*================================================================
    **
    **  FSX8000
    **
    ================================================================*/
    // FSXのデータパス(コンバートPGからの相対パス)
    define("PATH_FSX8000","//127.0.0.1/FSX8800/");
    // 配置設定ファイル名
    define("FILE_HAITI", "haiti.dat");
    // HV用データファイル名
    define("FILE_HV", "hv.dat");
    // HV用５分スランプファイル名
    define("FILE_HV_MIN", "hv_min.dat");
    // 特賞大当り履歴ファイル名
    define("FILE_OOATARI", "ooatari.dat");
    // 特賞大当り履歴ファイル名
    define("FILE_OOATAEI_IDX", "ooatari.inf");

    /*================================================================
    **
    **  DAC-800Z/D
    **
    ================================================================*/
    //ポート番号
    define("ZDT_PORT", 3000);
    // コマンドラインアプリケーション(ZDTCLIENT)
    define("ZDT_COMMAND", "C:\\ZDTRANS\\ZDTCLIENT");
    //特賞データ格納ホスト    ADD '06.09.15 H.Kondo
    define("ZD_TOKUSHO_HOSTNAME", "127.0.0.1");
    //特賞データ格納フォルダ  ADD '06.09.15 H.Kondo
    define("ZD_TOKUSHO_DIR", "Dac800ZI_Public");

    /*================================================================
    **
    **  タムス出力データファイル (CSV)
    **
    ================================================================*/
    // 出力データファイルパス
    define("JT_CSV_PATH", "C:\\INFO_DATA\\DAI_DATA");
    // 出力データファイルバックアップパス
    define("JT_CSV_BACKUP_PATH", JT_CSV_PATH."\\"."backup");
    // 出力データファイル名
    define("JT_CSV_FILENAME", "HCDATA.CSV");
    // 出力データファイルオープンリトライ回数
    define("JT_CSV_RETRY", 10);
    // 出力データファイルオープンリトライ間隔（秒）
    define("JT_CSV_RETRY_TIME", 10);

    /*================================================================
    **
    **  E-Navi
    **
    ================================================================*/
    // FTPユーザ名
    define("KITAC_USER", "kitac");
    // FTPパスワード
    define("KITAC_PASSWD", "kitac");
    // FTPパス
    define("KITAC_PATH", "/DB");
    // CSVファイル更新インターバル
    define("KITAC_CSV_INTERVAL", 10);
    // MDBファイル更新インターバル
    define("KITAC_MDB_INTERVAL", 10);
    // MDBファイルタイトル
    define("KITAC_MDB_TITLE", "PD_PMS");
    // MDBファイル拡張子
    define("KITAC_MDB_EXT", ".MDB");
    // CSVファイル名
    define("KITAC_CSV_NAME", "PC_DAI.CSV");

    /*================================================================
    **
    **  メイン親機のデータベース
    **
    ================================================================*/
    //情報公開メイン親機ホスト名
    define("MAIN_HOSTNAME", "127.0.0.1");
    // データベース
    define("MAIN_DATABASE", MAIN_HOSTNAME.":HSMJTCOM");
    // ユーザ名
    define("MAIN_USERNAME", "SYSDBA");
    // パスワード
    define("MAIN_PASSWORD", "marskey");

    /*================================================================
    **
    **  ホールコンピュータのデータベース
    **
    ================================================================*/
    //サーバー名
    define("HC_HOSTNAME", "127.0.0.1");
    // データベース
    define("HC_DATABASE", HC_HOSTNAME.":HSMWKGDB");
    // ユーザ名
    define("HC_USERNAME", "MARS");
    // パスワード
    define("HC_PASSWORD", "mars");
    // ホールコンピュータタイプ
    define("HC_TYPE_M7",              1);
    define("HC_TYPE_DAC800PRO",       2);
    define("HC_TYPE_FSX8800",         3);
    define("HC_TYPE_DAC800ZV1",       4);
    define("HC_TYPE_DAC800ZV2",       5);
    define("HC_TYPE_TAMS",            6);
    define("HC_TYPE_DAC800PROZ",      7);
    define("HC_TYPE_ENAVI",           8);
    define("HC_TYPE_IMS_M7",          9);
    define("HC_TYPE", HC_TYPE_IMS_M7);

    define("UPLOAD_DIR", "../img_staff");

    /*================================================================
    **
    **  データベース (ホールコンテンツサーバ)
    **
    ================================================================*/
    //ホールコンテンツサーバホスト名
    define("HCS_HOSTNAME", "127.0.0.1");
    // データベース
    define("HCS_DATABASE", HCS_HOSTNAME.":MIPS");
    // ユーザ名
    define("HCS_USERNAME", "MIPSUSER");
    // パスワード
    define("HCS_PASSWORD", "mars");

    /*================================================================
    **
    **  通信設定ファイル
    **
    ================================================================*/
    //
    define("JT_ROOT", "C:/JT");
    define("JT_BIN_DIR", JT_ROOT."/bin");
    define("JTSETTINGFILE", JT_BIN_DIR . "/JTSetting.ini");
    define("CARDAUTHFILE", JT_BIN_DIR . "/CardAuth.dat");
    define("TCPMANAGEFILE", JT_BIN_DIR . "/TcpManage.ini");
    define("RTN_CODE", "\r\n");
    define("JT_CNF_DIR", JT_ROOT."/conf");
    define("JTCHILDLSTFILE", JT_CNF_DIR . "/jt_child.lst");
    define("JTCHILDWOLFILE", JT_CNF_DIR . "/jt_child.wol");
    define("LOCALSETTINGFILE", JT_CNF_DIR . "/localSetting.xml");   // ローカル通信設定ファイル ADD '09.02.06 H.Kondo

    /*================================================================
    **
    **  環境設定ファイル
    **
    ================================================================*/
    define("JT_INI_DIR", JT_ROOT."/ini");
    define("SCREENSAVERFILE", JT_INI_DIR . "/Screensaver.txt");
    define("STAFFINRODUCTFILE", JT_INI_DIR . "/StaffIntroduct.txt");
    define("STAFFRANKINGFILE", JT_INI_DIR . "/StaffRanking.txt");
    define("STAFFRANKINGTOP3FILE", JT_INI_DIR . "/StaffRanking_top3.txt");
    define("USERSCROLLMSGFILE", JT_INI_DIR . "/UserScrollMsg.txt");
    define("PLAYMODEMSGFILE", JT_INI_DIR . "/PlayModeMsg.txt");     // 遊技モードチェックメッセージファイル ADD '09.02.06 H.Kondo
    define("STAFF_DISPITEM_INTRODUCT"    , 1);
    define("STAFF_DISPITEM_RANKING"      , 2);
    define("STAFF_DISPITEM_RANKING_TOP3" , 3);

    define("APP_ROOT", "C:/inetpub/wwwroot");
    define("APP_CONF_DIR", APP_ROOT."/PHP/conf");
    define("APP_BIN_DIR", APP_ROOT."/PHP/bin");
    define("INIXMLFILE", APP_CONF_DIR . "/ini.xml");
    define("APP_IMG_MAP_DIR", APP_ROOT."/PHP/img_map");
    define("APP_IMG_STAFF_DIR", APP_ROOT."/PHP/img_staff");
    define("ENVSETTINGFILE", APP_BIN_DIR . "/env.dat");     // 環境変数設定ファイル ADD '06.02.16 H.Kondo
    define("JTUPLOADEXE", JT_BIN_DIR . "/JTUpload.exe");
    define("JTSETTINGEXE", JT_BIN_DIR . "/JTSetting.exe");
    define("GETMACADDREXE", JT_BIN_DIR . "/GetMacAddr.exe");
    define("ACCESSHYPER", JT_BIN_DIR . "/JTHyperAccess.exe");
    define("ENVSETEXE", APP_BIN_DIR . "/environment.wsf");    // 環境変数設定ツール ADD '06.02.16 H.Kondo
    define("FTP_ROOT", "C:/inetpub/ftproot");
    define("CHGENVBAT", APP_ROOT . "/PHP/bat/ChangeEnvironment.bat"); // 環境切り替えバッチ ADD '06.03.28 H.Kondo

    /*================================================================
    **
    **  ログファイル
    **
    ================================================================*/
    define("LOGFILE", APP_ROOT."/PHP/logs/jotan.log");

    /*================================================================
    **
    **  FTP設定
    **
    ================================================================*/
    // FTPサーバ・ポート・タイムアウト
    define("FTP_SERVER", "127.0.0.1");
    define("FTP_PORT", 21);
    define("FTP_TIMEOUT", 15);

    // FTP ユーザ・パスワード
    define("FTP_USER", "mars");
    define("FTP_PASSWD", "marsadmin");

    // FTPパス（マスタファイル）
    define("FTP_MASTERFILE_DIR", "/INFO_DATA/MASTER_DATA2");

    // FTPパス（定刻）
    define("FTP_SCHEDULE_DIR", "/INFO_DATA/SCHEDULED_DATA");

    // ローカルディレクトリ
    define("FTP_LOCAL_DIR", "C:/INFO_DATA");

    // ローカルディレクトリ（マスタファイル）
    define("FTP_LOCAL_MASTERFILE_DIR", FTP_LOCAL_DIR . "/MASTER_DATA2");

    // ローカルディレクトリ（定刻ファイル）
    define("FTP_LOCAL_SCHEDULEFILE_DIR", FTP_LOCAL_DIR . "/SCHEDULED_DATA");

    // 定刻データファイル名(パチンコ）
    define("FTP_LOCAL_SCHEDULEFILE_FILE_P", "TEIKOKU_P.xml");

    // 定刻データファイル名(スロット）
    define("FTP_LOCAL_SCHEDULEFILE_FILE_S", "TEIKOKU_S.xml");

    // 転送モード
    define("FTP_TRANSMIT", FTP_BINARY);

    // コネクト失敗時ウエイト時間
    define("FTP_RETRY_WAIT_TIME", 10);

    // コネクト失敗リトライ回数
    define("FTP_RETRY_COUNT", 10);

    define("UPLOAD_DIR", "../img_staff");

    // ホールイメージツールディレクトリ
    define("IMG_TOOL_DIR"       , "../img_maptool/" );
    // ホールマップ出力ディレクトリ
    define("IMG_MAP_DIR"        , "../img_map/"     );
    // ホールマップ名
    define("HOLE_MAP_NAME"      , "holeMap.png"     );
    // サブマップタイトル
    define("SUB_MAP_FILE_TITLE" , "submap_"         );
    // サブマップ拡張子
    define("SUB_MAP_FILE_EXT"   , ".png"            );

    // MACアドレス取得用PHP
    define("MAC_ADDR_PHP"       ,"/PHP/FlashXML/GetMacAddress.php");

    // 環境切り替えバッチ ADD '06.03.28 H.Kondo
    define("CHG_ENV_PHP"       ,"/PHP/FlashXML/ChangeEnvironment.php");

    // ハイパーへのアクセス
    define("HYPER_ACCESS", true);

    /*================================================================
    **
    **  エラーハンドラの設定
    **  ※編集
    ================================================================*/

    set_error_handler("error_handler");

    function error_handler($errno, $errmsg, $file, $line, $context)
    {
        switch ($errno)
        {
            case E_USER_ERROR:
                log_write( "ERROR", $errno, $errmsg, $file, $line);
                break;
            case E_USER_NOTICE:
                log_write( "NOTICE", $errno, $errmsg, $file, $line);
                break;
            case E_USER_WARNING:
                log_write( "WARNING", $errno, $errmsg, $file, $line);
                break;
            default:
                log_write( "ALERT", $errno, $errmsg, $file, $line);
                break;
        }


    }


    /*================================================================
    **
    **  ログ出力
    **
    ================================================================*/
    function log_write( $type, $errno, $errmsg, $file, $line){

        $errmsg = mb_convert_encoding($errmsg, "UTF-8", mb_detect_encoding($errmsg));
        error_log(date("Y/m/d H:i:s") . " " . $type . "@" . $file . ":" . $line . "\t[" . $errno . "]" . $errmsg . "\n", 3, LOGFILE);
    }

?>
