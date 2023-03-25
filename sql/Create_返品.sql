
DROP TABLE 返品;

--返品テーブル作成
--主キー   返品番号
--外部キー 売上番号 オプション ON DELETE CASCADE→外部キーが消えると連動して削除される
CREATE TABLE 返品
(
返品番号 INTEGER,
売上番号 INTEGER UNIQUE NOT NULL,
返品日付 DATE NOT NULL,
理由 VARCHAR(100) DEFAULT NULL,
PRIMARY KEY(返品番号),
FOREIGN KEY(売上番号) REFERENCES 売上(売上番号) ON DELETE CASCADE
)
;


--返品テーブル作成
--主キー   返品番号
--外部キー 売上番号 オプション ON DELETE SET NULL→外部キーが消えると連動してNULLになる
CREATE TABLE 返品
(
返品番号 INTEGER,
売上番号 INTEGER UNIQUE,
返品日付 DATE NOT NULL,
理由 VARCHAR(100) DEFAULT NULL,
PRIMARY KEY(返品番号),
FOREIGN KEY(売上番号) REFERENCES 売上(売上番号) ON DELETE SET NULL 
)
;

--ON DELETE CASCADE
--ON DELETE SET NULL 
--ON DELETE NO ACTION




--複数のカラムを主キー、外部キーとして設定する
--返品テーブル作成
--主キー   返品番号
--外部キー 売上番号 オプション ON DELETE CASCADE→外部キーが消えると連動して削除される
CREATE TABLE 返品
(
返品番号 INTEGER,
返品日付 DATE NOT NULL,
理由 VARCHAR(100) DEFAULT NULL,
PRIMARY KEY(返品番号)
)
;

CREATE TABLE 返品明細
(
返品番号 INTEGER,
返品明細番号 INTEGER,
売上番号 INTEGER NOT NULL,
売上明細番号 INTEGER NOT NULL,
PRIMARY KEY(返品番号,返品明細番号),
FOREIGN KEY(返品番号) REFERENCES 返品(返品番号),
FOREIGN KEY(売上番号,売上明細番号) REFERENCES 売上明細(売上番号,明細番号)
)
;