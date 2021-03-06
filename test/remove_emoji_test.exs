defmodule RemoveEmojiTest do
  use ExUnit.Case

  def clean_newline_chars(value) do
    Regex.replace(~r/[\r\n]/u, value, "")
  end

  def sanitize(original_string) do
    original_string
    |> clean_newline_chars()
    |> RemoveEmoji.sanitize()
  end

  doctest RemoveEmoji

  test "it can remove any emoji" do
    original_string = """
...‼⁉™↔↕↖↗↘↙↩↪⌚⌛⌨⏏⏩⏪⏫⏬⏭⏮⏯⏰⏱⏲
⏳⏸⏹⏺Ⓜ▪▫▶◀◻◼◽◾☀☁☂☃☄☎☑☔☕☘☝☠☢☣☦☪☮☯☸
☹☺♀♂♈♉♊♋♌♍♎♏♐♑♒♓♠♣♥♦♨♻♿⚒⚓⚔⚕⚖⚗⚙⚛
⚜⚠⚡⚪⚫⚰⚱⚽⚾⛄⛅⛈⛎⛏⛑⛓⛔⛩⛪⛰⛱⛲⛳⛴⛵⛷⛸
⛹⛺⛽✂✅✈✉✊✋✌✍✏✒✔✖✝✡✨✳✴❄❇❌❎❓❔❕❗❣❤➕➖➗➡⤴
⤵⬅⬆⬇⬛⬜⭐⭕〰〽㊗㊙🀄🃏🅰🅱🅾🅿🆎🆑🆒🆓🆔🆕🆖🆗🆘🆙🆚🈁
🈂🈚🈯🈲🈳🈴🈵🈶🈷🈸🈹🈺🉐🉑🌀🌁🌂🌃🌄🌅🌆🌇🌈🌉🌊🌋🌌🌍
🌎🌏🌐🌑🌒🌓🌔🌕🌖🌗🌘🌙🌚🌛🌜🌝🌞🌟🌠🌡🌤🌥🌦🌧🌨🌩🌪
🌫🌬🌰🌱🌲🌳🌴🌵🌶🌷🌸🌹🌺🌻🌼🌽🌾🌿🍀🍁🍂🍃🍄🍅🍆🍇🍈
🍉🍊🍋🍌🍍🍎🍏🍐🍑🍒🍓🍔🍕🍖🍗🍘🍙🍚🍛🍜🍝🍞🍟🍠🍡🍢🍣
🍤🍥🍦🍧🍨🍩🍪🍫🍬🍭🍮🍯🍰🍱🍲🍳🍴🍵🍶🍷🍸🍹🍺🍻🍼🍽🎀
🎁🎂🎃🎄🎅🎆🎇🎈🎉🎊🎋🎌🎍🎎🎏🎐🎑🎒🎓🎖🎗🎙🎚🎛🎞🎟🎠
🎡🎢🎣🎤🎥🎦🎧🎨🎩🎪🎫🎬🎭🎮🎯🎰🎱🎲🎳🎴🎵🎶🎷🎸🎹🎺🎻
🎼🎽🎾🎿🏀🏁🏂🏃🏄🏅🏆🏇🏈🏉🏊🏋🏌🏍🏎🏔🏕🏖🏗🏘🏙🏚🏛
🏜🏝🏞🏟🏠🏡🏢🏣🏤🏥🏦🏧🏨🏩🏪🏫🏬🏭🏮🏯🏰🏳🏴🏵🏷🐀🐁
🐂🐃🐄🐅🐆🐇🐈🐉🐊🐋🐌🐍🐎🐏🐐🐑🐒🐓🐔🐕🐖🐗🐘🐙🐚🐛🐜
🐝🐞🐟🐠🐡🐢🐣🐤🐥🐦🐧🐨🐩🐪🐫🐬🐭🐮🐯🐰🐱🐲🐳🐴🐵🐶🐷
🐸🐹🐺🐻🐼🐽🐾🐿👀👁👂👃👄👅👆👇👈👉👊👋👌👍👎👏👐👑👒
👓👔👕👖👗👘👙👚👛👜👝👞👟👠👡👢👣👤👥👦👧👨👩👪👫👬👭
👮👯👰👱👲👳👴👵👶👷👸👹👺👻👼👽👾👿💀💁💂💃💄💅💆💇💈
💉💊💋💌💍💎💏💐💑💒💓💔💕💖💗💘💙💚💛💜💝💞💟💠💡💢💣
💤💥💦💧💨💩💪💫💬💭💮💯💰💱💲💳💴💵💶💷💸💹💺💻💼💽💾
💿📀📁📂📃📄📅📆📇📈📉📊📋📌📍📎📏📐📑📒📓📔📕📖📗📘📙
📚📛📜📝📞📟📠📡📢📣📤📥📦📧📨📩📪📫📬📭📮📯📰📱📲📳📴
📵📶📷📸📹📺📻📼📽🔀🔁🔂🔃🔄🔅🔆🔇🔈🔉🔊🔋🔌🔍🔎🔏🔐🔑
🔒🔓🔔🔕🔖🔗🔘🔙🔚🔛🔜🔝🔞🔟🔠🔡🔢🔣🔤🔥🔦🔧🔨🔩🔪🔫🔬
🔭🔮🔯🔰🔱🔲🔳🔴🔵🔶🔷🔸🔹🔺🔻🔼🔽🕉🕊🕐🕑🕒🕓🕔🕕🕖🕗
🕘🕙🕚🕛🕜🕝🕞🕟🕠🕡🕢🕣🕤🕥🕦🕧🕯🕰🕳🕴🕵🕶🕷🕸🕹🖇🖊
🖋🖌🖍🖐🖕🖖🖥🖨🖱🖲🖼🗂🗃🗄🗑🗒🗓🗜🗝🗞🗡🗣🗨🗯🗳🗺🗻
🗼🗽🗾🗿😀😁😂😃😄😅😆😇😈😉😊😋😌😍😎😏😐😑😒😓😔😕😖
😗😘😙😚😛😜😝😞😟😠😡😢😣😤😥😦😧😨😩😪😫😬😭😮😯😰😱
😲😳😴😵😶😷😸😹😺😻😼😽😾😿🙀🙁🙂🙅🙆🙇🙈🙉🙊🙋🙌🙍🙎
🙏🚀🚁🚂🚃🚄🚅🚆🚇🚈🚉🚊🚋🚌🚍🚎🚏🚐🚑🚒🚓🚔🚕🚖🚗🚘🚙
🚚🚛🚜🚝🚞🚟🚠🚡🚢🚣🚤🚥🚦🚧🚨🚩🚪🚫🚬🚭🚮🚯🚰🚱🚲🚳🚴
🚵🚶🚷🚸🚹🚺🚻🚼🚽🚾🚿🛀🛁🛂🛃🛄🛅🛋🛌🛍🛎🛏🛠🛡🛢🛣🛤
🛥🛩🛫🛬🛰🛳...
"""
    expect_string = "......"
    sanitized_string = original_string |> sanitize

    assert sanitized_string == expect_string
  end

  test "flag emoji must be deleted" do
    original_string = """
...
🇦🇺🇨🇦🇨🇭🇨🇳🇩🇪🇪🇸🇫🇷🇬🇧🇮🇱🇮🇹
🇯🇵🇰🇳🇰🇷🇳🇴🇳🇵🇵🇸🇶🇦🇷🇺🇸🇸🇺🇸
🏳️🏴🏁🚩🏳️‍🌈🇹🇹🇹🇷🇹🇨🇨🇳🇨🇫🇧🇹🇹🇲
🇼🇸🇸🇻🇨🇾🇷🇴🇷🇴🇬🇺🇸🇩🇲🇽🇩🇪🇱🇦
🇱🇨🇸🇳🇱🇰🇫🇯🇲🇿🇮🇲🇲🇰🇲🇾🇾🇹🇳🇿
🇬🇩🇨🇷🇺🇸🇻🇮🇹🇩🇿🇦🇦🇶🇰🇪🇬🇫🇿🇲
...
"""

    expect_string = "......"
    sanitized_string = original_string |> sanitize

    assert sanitized_string == expect_string
  end

  test "apple emoji must be deleted" do
    original_string = """
...
🚗🚓🚨🚲🚡🚅🛶💺🚏🏦🕋🏦📱⌚️🖲🕯🔮🎎🎐💌📦
📌☮️💟🔯☪️㊗️🈵🆚💯❕🔞🚷🔰⁉️⚠️💤🌐🌀▶️🔠🔣↔️↩️👁‍🗨
◽️🔲🇵🇦🏳️🏳️‍🌈🇹🇲🇹🇷🤛🤜🏼👍🏽👌☝🏼🥝🥦🌶🌽🍎
🍲🍔🥞🍝🍔🍗🌮🍯🥠🥢🍴🥄🥂☕️😀😃😄🤣😂😅😆☺️😊😍😌
😘😗😙😚😜😝😛😋🤨🧐🤓😒😏🤩🤩😎😞😔😖😢😣☹️😩🙁🤯
😰😓😦😲🤒🤕👿👹👽✊🏼
...
"""

    expect_string = "......"
    sanitized_string = original_string |> sanitize

    assert sanitized_string == expect_string
  end

  test "truncate fitzpatrick modifiers " do
    original_string = ".👦👦🏻👦🏼👦🏽👦🏾👦🏿👧👧🏻👧🏼👧🏽👧🏾👧🏿👨👨🏻👨🏼👨🏽👨🏾👨🏿👩👩🏻👩🏼👩🏽👩🏾👩🏿."

    expect_string = ".."
    sanitized_string = original_string |> sanitize

    assert sanitized_string == expect_string
  end

  test "pure text emoji must be deleted" do
    original_string = """
...
㊗★☎☏♡♥♣♧☻☺♠♤▪▫
...
"""

    expect_string = "......"
    sanitized_string = original_string |> sanitize

    assert sanitized_string == expect_string
  end


  test "should keep normal text" do
    original_string = """
~!@{}$%^&()_+=.'"~ \ | /?>><<:;#*
œ∑´†¥¨ˆøπ“‘«åß∂ƒ˙∆˚¬…æΩ≈ç√∫˜µ≤≥÷
『』：“｜，。？～！＠＃＄％＾＆＊（）＿＋
abcdefghijklmnopqrstuvwxyz....0123456789
ABCDEFGHIJKLMNOPQRSTUVWXYZ....0123456789
◎　⊕　⊙　○　●　△　▲　▽　▼　☆　◇　◆　□ ■ ◐ ◑
＿　ˍ　▁　▂　▃　▄　▅　▆　▇　█　▏　▎　▍　▌
　▋　▊　▉　◢　◣　◥　◤　►　◄
▣　▤　▥　▦　▧　▨　▩　▒　░
①　②　③　④　⑤　⑥　⑦　⑧　⑨　⑩　⑪　⑫　⑬　⑭ ⑮
⑯　⑰　⑱　⑲　⑳  ㊣　㊟　㊕　㊡　㊝
⑴　⑵　⑶　⑷　⑸ 　⑹　⑺　⑻　⑼　⑽
㈠　㈡　㈢　㈣　㈤　㈥　㈦　㈧　㈨　㈩
１　２　３　４　５　６　７　８　９　０　〡　〢　〣　〤 〥 
〦　〧　〨　〩　十　卄　卅 
Ⅰ　Ⅱ　Ⅲ　Ⅳ　Ⅴ　Ⅵ　Ⅶ　Ⅷ　Ⅸ　Ⅹ　Ⅺ　Ⅻ
ⓐ　ⓑ　ⓒ　ⓓ　ⓔ　ⓕ　ⓖ　ⓗ　ⓘ　ⓙ　ⓚ　ⓛ　ⓜ　ⓝ　ⓞ　
ⓟ　ⓠ　ⓡ　ⓢ　ⓣ　ⓤ　ⓥ　ⓦ　ⓧ　ⓨ　ⓩ
⒜　⒝　⒞　⒟　⒠　⒡　⒢　⒣　⒤　⒥　⒦　⒧　⒨　⒩　⒪　
⒫　⒬　⒭　⒮　⒯　⒰　⒱　⒲　⒳　⒴　⒵
Α　Β　Γ　Δ　Ε　Ζ　Η　Θ　Ι　Κ　Λ　Μ　Ν　Ξ　Ο　Π　Ρ
Σ　Τ　Υ　Φ　Χ　Ψ　Ω　α　 ν　ξ　ο　π　ρ　σ τ　υ　φ　
χ　ψ　ω 
╳　＋　﹢　－　×　÷　＝　≠　≒　∞　ˇ　±　√　⊥　∠　∟　⊿　㏒
㏑　∫　∮　∵　∴
ㄅ　ㄆ　ㄇ　ㄈ　ㄉ　ㄊ　ㄋ　ㄌ　ㄍ　ㄎ　ㄏ　ㄐ　ㄑ　ㄒ ㄓ　ㄔ
ㄕ　ㄖ　ㄗ　ㄘ　ㄙ　ㄚ　ㄛ　ㄜ　ㄝ　ㄞ ㄟ　ㄠ　ㄡ　ㄢ　ㄣ　ㄤ
ㄥ　ㄦ　ㄧ　ㄨ　ㄩ　˙　ˊ　ˇ　ˋ 
Ä　Ã　Ç　Ê　Ë　Î　Ï　Ð　Ñ　Õ　Ö　Û　Ü　ã　ä　ê　ë　î ï　õ
ö　Ÿ　Ŵ　Ž　Ť　Ř　Ň　ĩ　ħ　ą　č　Ĥ
== Sample Text for Test Program ==
「にっぽん」、「にほん」と読まれる。どちらも多く用いられているため、
日本政府は正式な読み方をどちらか一方には定めておらず、どちらの読みで
も良いとしている[5]。

7世紀の後半の国際関係から生じた「日本」国号は、当時の国際的な読み（音読）
で「ニッポン」（呉音）ないし「ジッポン」（漢音）と読まれたものと推測される
[6]。いつ「ニホン」の読みが始まったか定かでない。仮名表記では「にほん」と
表記された。平安時代には「ひのもと」とも和訓されるようになった。
室町時代の謡曲・狂言は、中国人に「ニッポン」と読ませ、日本人に「ニホン」と
読ませている。安土桃山時代にポルトガル人が編纂した『日葡辞書』や『日本小文
典』等には、「ニッポン」「ニホン」「ジッポン」の読みが見られ、その用例から
判断すると、改まった場面・強調したい場合に「ニッポン」が使われ、日常の場面
で「ニホン」が使われていた[7]。このことから小池清治は、中世の日本人が中国
語的な語感のある「ジッポン」を使用したのは、中国人・西洋人など対外的な場面
に限定されていて、日常だと「ニッポン」「ニホン」が用いられていたのでは、と
推測している[8]。なお、現在に伝わっていない「ジッポン」音については、その
他の言語も参照。

مندوبة واشنطن في الأمم المتحدة: لا تغير في سلوك إيران المزعزع
لمنطقة الشرق الأوسط هيلي: التحرك ضد إيران سيبدأ من مجلس الأمن
ويتوسع ليشمل المجتمع الدولي بكامله هيلي: على المجتمع الدولي أن
يتحرك قبل أن تصبح إيران مثل كوريا الشمالية هيلي: انتهاكات إيران
تتوسع من اليمن للبنان والعراق وسوريا هيلي: نريد بناء تحالف دولي
＊這是一段測試文字，用來告訴你真的我很想刪掉過濾不掉的 Emoji XD
＊系統不會刪除到中文、韓文、阿拉伯文、日文，請放心使用。
＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝
近代以降も「ニッポン」「ニホン」両方使用される中、1934年（昭和9年）
には文중국, 일본, 베트남 등 한자 문화권에 속하는 아시아 여러 국가에서는 
한국어的差异外，通常认为还存在词汇上的差异。例如繁体中文里多用的“原
لمنطقة الشرق الأوسط هيلي: التحرك ضد إيران سيبدأ من مجلس الأمن
ويتوسع ليشمل المجتمع الدولي بكامله هيلي: على المجتمع الدولي أن
子笔”，在œ∑´†¥¨ˆøπ“‘«åß∂ƒ˙∆˚¬…æΩ≈ç√∫˜µ≤≥÷『』：“｜，。？～！
＠＃＄％＾＆＊（）＿＋abcdefghijklmnopqrstuvwxyz....0123456789
㈠　㈡　㈢　㈣　㈤　㈥　㈦　㈧　㈨　㈩１　２　３　４　５　６　７　
８　９　０　〡　〢　〣　〤 〥 〦　〧　〨　〩　十　卄　卅 Ⅰ　Ⅱ　Ⅲ　
Ⅳ　Ⅴ　Ⅵ　Ⅶ　Ⅷ　Ⅸ　Ⅹ　Ⅺ
]　Ⅻⓐ　ⓑ　ⓒ　ⓓ　ⓔ　ⓕ　ⓖ　ⓗ　ⓘ　ⓙ　ⓚ　ⓛ　ⓜ　ⓝ　ⓞ　
简体中文和繁体中文除了汉字写法（如简化字和繁体字间，以及各地汉字写法规范）
的差异外，通常认为还存在词汇上的差异。例如繁体中文里多用的“原子笔”，在
简体中文中多用“圆珠笔”，繁体中文里的“史达林”在简体中文里被称为“斯大林”，
繁体中文里的“北韩”在简体中文里被称为“朝鲜〔此处指朝鲜民主主义人民共和国〕
”，繁体中文里的“雪梨〔澳大利亚城市〕”在简体中文里被称为“悉尼”等。由于有这
种差异，“简体用语”这种说法随之产生。不过其实这并非繁简中文本身的差异，而
主要是由于使用两者的人群，尤其是中国大陆和台湾在20世纪中叶由于政治原因分隔
后交流较少，造成了用词习惯的差异。这种现象在1980年代以来由于科技术语的不同
중화인민공화국은 조선민주주의인민공화국과의 밀접한 관계에 따라 한국어를 주
로 '차오셴위(중국어: 朝鲜语, 병음: Cháoxiǎnyǔ, 조선어)'라고 부른다
. 1992년 대한민국과의 수교 이후에 양국이 활발한 교류를 하게 되면서 '한
궈위(중국어: 韩国语, 병음: Hánguóyǔ, 한국어)' 또는 '한위'(韓語, 한
어) 등의 명칭이 쓰이기도 하나, 학술상으로는 여전히 문화어 계열 어휘를 많
이 사용한다.
その他、各国語で日本を意味する固有名詞は、アン チャパイン（愛: an tSeapáin）、
ヤーパン（独: Japan）、ジャポン（仏: Japon）、ヤパン（蘭: Japan）、ハポン（西:
 Japón）、ジャッポーネ（伊: Giappone）、ヤポニヤ（波: Japonia）、ヤポーニヤ（
 露: Япония）、イープン（泰: ญี่ปุ่น）など、特定の時期に特定の地域の中国語で「日
 本国」を発音した「ジーパングォ」を写し取った（日本語読みの「ジッポン」に由来すると
 の説もある）、ジパング (Xipangu/Zipang/Zipangu) ないしジャパング (Japangu) 
 を語源とすると考えられる。
 7世紀の後半の国際関係から生じた「日本」国号は、当時の国際的な読み（音読）
で「ニッポン」（呉音）ないし「ジッポン」（漢音）と読まれたものと推測される
[6]。いつ「ニホン」の読みが始まったか定かでない。仮名表記では「にほん」と
表記された。平安時代には「ひのもと」とも和訓されるようになった。
室町時代の謡曲・狂言は、中国人に「ニッポン」と読ませ、日本人に「ニホン」と
読ませている。安土桃山時代にポルトガル人が編纂した『日葡辞書』や『日本小文
典』等には、「ニッポン」「ニホン」「ジッポン」の読みが見られ、その用例から

間我險不此學，天可所以沒得溫資日園，法死什，營的對記，大客這有團隨命，地家該心別
開，把區大紅兒原，背應即政雖際活；而以法到這？呢龍為現子！

長得子別是會。樣稱場布他發童區清接人部參作臺不節……們獎應；是味在……著黑不子望媽館
。治久識、美開的食的科大計天不可器性！主長雄我道；大大是簡。北行語甚教市教學動有
轉成但機看技前只，並起切；受完緊認爾高他下外。親國是時安的。好實此時做萬自住、高
兒全議？

像化不是你他上象要代南子並試告論度園還以研影顧新排議營望相超海我。病感
"""

    expect_string = original_string
    sanitized_string = original_string |> RemoveEmoji.sanitize

    assert sanitized_string == expect_string
  end

end
