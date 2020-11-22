-- 部マスタ作成
CREATE TABLE nsca_cpt_original_exercise.parts (
    id INT NOT NULL PRIMARY KEY,
    title VARCHAR(255)
);

-- 章マスタ作成
CREATE TABLE nsca_cpt_original_exercise.chapters (
    id INT NOT NULL PRIMARY KEY,
    title VARCHAR(255)
);


-- 部データ保存
INSERT INTO nsca_cpt_original_exercise.parts (id, title) VALUES
    (1, "エクササイズサイエンス"),
    (2, "初回面談と評価"),
    (3, "エクササイズテクニック"),
    (4, "プログラムデザイン"),
    (5, "特定のクライアント向けに"),
    (6, "安全性と法的問題")
;

-- 部データ保存
INSERT INTO nsca_cpt_original_exercise.chapters (id, title) VALUES
    (1, "")
    (2, "")
    (3, "")
    (4, "")
    (5, "")
    (6, "")
    (7, "")
    (8, "")
    (9, "")
    (10, "")
    (11, "")
    (12, "")
    (13, "")
    (14, "")
    (15, "")
    (16, "")
    (17, "")
    (18, "")
    (19, "")
    (20, "")
    (21, "")
    (22, "")
    (23, "")
    (24, "")
    (25, "")
;

