# language: ja

@javascript
フィーチャ: 収支入力画面
  収支入力をする。
 
  シナリオ: "収支入力"ページを表示する。
    前提 収支入力ページを表示している
    ならば "出金・入金の登録"と表示されていること

  シナリオ: "簡易入力"ページを表示する。
    前提 収支入力ページを表示している
    もし "かんたん入力"リンクをクリックする
    ならば "▽▽▽"と表示されていること
    
  シナリオ: "簡易入力"ページから登録を行う。
    前提 収支入力ページを表示している
    もし "かんたん入力"リンクをクリックする
    かつ "item_name"に"テストです"と入力する
    かつ "action_date"に"2012/1/23"と入力する
    かつ "amount"に"100"と入力する
    かつ "登録"ボタンをクリックする
    ならば "登録しました。 2012/01/23 テストです 100円"と表示されていること
    
  シナリオ: "通常入力"ページから登録を行う。
    前提 収支入力ページを表示している
    もし "action_date"に"2012/2/12"と入力する
    かつ "item_name"に"テストです"と入力する
    かつ "from"から"bank1"を選択する
    かつ "to"から"outgo13"を選択する
    かつ "amount"に"1000"と入力する
    かつ "登録"ボタンをクリックする
    ならば "登録しました。 2012/02/12 テストです 1,000円"と表示されていること
    かつ "div#items > div > div.item_name"に"テストです"と表示されていること
    かつ "div#items > div > div.item_date"に"2012/02/12"と表示されていること
    かつ "div#items > div > div.item_from"に"bank1"と表示されていること
    かつ "div#items > div > div.item_to"に"outgo13"と表示されていること
    かつ "div#items > div > div.item_amount"に"1,000円"と表示されていること

  シナリオ: "残高調整登録"ページから登録を行う。
    前提 残高調整登録ページを表示している
    もし "action_date"に"2012/2/12"と入力する
    かつ "to"から"bank1"を選択する
    かつ "adjustment_amount"に"100000"と入力する
    かつ "登録"ボタンをクリックする
    ならば "登録しました。 2012/02/12 残高調整 100,000円"と表示されていること
    かつ "div#items > div > div.item_name"に"残高調整 100,000円"と表示されていること
    かつ "div#items > div > div.item_date"に"2012/02/12"と表示されていること
    かつ "div#items > div > div.item_from"に"(残高調整)"と表示されていること
    かつ "div#items > div > div.item_to"に"bank1"と表示されていること
    かつ "div#items > div > div.item_amount"に/円$/と表示されていること


