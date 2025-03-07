
/*
Real time subtitle translate for PotPlayer using deeplx free API via proxy
*/

// 解析 JSON 返回结果，优先提取 "data" 字段，若无则取 "alternatives" 数组的第一个结果
string JsonParse(string json)
{
    JsonReader Reader;
    JsonValue Root;
    string ret = "";
    if (Reader.parse(json, Root) && Root.isObject())
    {
        JsonValue data = Root["data"];
        if (data.isString())
        {
            return data.asString();
        }
        JsonValue alts = Root["alternatives"];
        if (alts.isArray() && alts.size() > 0)
        {
            JsonValue alt0 = alts[0];
            if (alt0.isString())
                return alt0.asString();
        }
    }
    return ret;
}

// 定义源语言和目标语言列表
array<string> SrcLangTable =
{
    "ar", "bg", "zh", "cs", "da", "nl", "en", "et", "fi", "fr",
    "de", "el", "hu", "id", "it", "ja", "ko", "lv", "lt", "nb",
    "pl", "pt", "ro", "ru", "sk", "sl", "es", "sv", "tr", "uk"
};

array<string> DstLangTable =
{
    "ar", "bg", "zh", "cs", "da", "nl", "en-gb", "en-us", "et", "fi",
    "fr", "de", "el", "hu", "id", "it", "ja", "ko", "lv", "lt",
    "nb", "pl", "pt-pt", "pt-br", "ro", "ru", "sk", "sl", "es", "sv",
    "tr", "uk"
};

// 定义请求时使用的 User-Agent 字符串
string UserAgent = "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36";

// 以下函数提供 UI 显示、版本信息、登录提示等
string GetTitle()
{
    return "DeepLX Translate";
}

string GetVersion()
{
    return "1";
}

string GetDesc()
{
    return "使用DeepLX免费API进行翻译";
}

string GetLoginTitle()
{
    return "No API key required";
}

string GetLoginDesc()
{
    return "No API key needed for deeplx free API";
}


string GetUserText()
{
    return "{$CP949=API 주소 : " + apiUrl + ")$}"
         + "{$CP950=API 地址 " + apiUrl + ")$}"
         + "{$CP936=API 地址 " + apiUrl + ")$}";
}

// 默认使用本地接口地址，如有需要请修改为实际地址或 IP；也可以在UI配置
string apiUrl = "http://127.0.0.1:1199";


string GetPasswordText()
{
    return "";
}

// 本地服务无需实际的登录验证，但需要配置DeepLX API接口
string ServerLogin(string User, string Pass)
{	
	string customApiUrl = "";
	customApiUrl = User;
	if (customApiUrl.empty()) return "Use default ApiUrl";
		else apiUrl = customApiUrl;
	return "200 ok";
}

void ServerLogout()
{
    // 无需处理登出操作
}

// 返回支持的源语言列表，空字符串表示自动检测
array<string> GetSrcLangs()
{
    array<string> ret = SrcLangTable;
    ret.insertAt(0, ""); // 空表示自动识别
    return ret;
}

// 返回支持的目标语言列表
array<string> GetDstLangs()
{
    array<string> ret = DstLangTable;
    return ret;
}

	
// Translate 函数：调用代理服务器（例如运行在 127.0.0.1:1199）
// 该代理服务器将 GET 请求转换为 POST 请求调用 deeplx 服务，并返回 JSON 结果
string Translate(string Text, string &in SrcLang, string &in DstLang)
{
    if (Text.empty()) return "";
    
    // 对文本进行 URL 编码
    string enc = HostUrlEncode(Text);
        string url = apiUrl + "/translate?text=" + enc;
		
    if (!SrcLang.empty())
    {
        url += "&source_lang=" + SrcLang;
    }
    url += "&target_lang=" + DstLang;
    
    // 发起 GET 请求（确保 HostUrlGetString 函数可用）
    string response = HostUrlGetString(url, UserAgent);
    
    // 解析 JSON 得到翻译结果
    string ret = JsonParse(response);
    if (ret.length() > 0)
    {
        // 对于部分从右向左书写的语言，添加 Unicode 方向标
        string UNICODE_RLE = "\u202B";
        if (DstLang == "fa" || DstLang == "ar" || DstLang == "he")
            ret = UNICODE_RLE + ret;
        // 转换编码标识，后续均使用 UTF8
        SrcLang = "UTF8";
        DstLang = "UTF8";
        return ret;
    }
    return "";
}
