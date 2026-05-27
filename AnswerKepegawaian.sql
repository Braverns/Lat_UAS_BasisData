-- =========================================================
-- KUNCI JAWABAN SUBQUERY
-- SOAL 1 - 40
-- =========================================================

-- =========================================================
-- SOAL 1
-- =========================================================

/*
SELECT
    p.nama_pegawai,
    g.bulan,
    g.total_gaji
FROM pegawai p
JOIN penggajian g
ON p.id_pegawai = g.id_pegawai
WHERE g.total_gaji >
(
    SELECT AVG(total_gaji)
    FROM penggajian
);
*/

-- =========================================================
-- SOAL 2
-- =========================================================

/*
SELECT
    nama_pegawai
FROM pegawai
WHERE id_departemen =
(
    SELECT id_departemen
    FROM departemen
    WHERE nama_departemen = 'Information Technology'
);
*/

-- =========================================================
-- SOAL 3
-- =========================================================

/*
SELECT
    nama_pegawai
FROM pegawai
WHERE id_jabatan =
(
    SELECT id_jabatan
    FROM jabatan
    WHERE nama_jabatan = 'Manager'
);
*/

-- =========================================================
-- SOAL 4
-- =========================================================

/*
SELECT
    nama_pegawai,
    tanggal_masuk
FROM pegawai
WHERE tanggal_masuk =
(
    SELECT MIN(tanggal_masuk)
    FROM pegawai
);
*/

-- =========================================================
-- SOAL 5
-- =========================================================

/*
SELECT
    p.nama_pegawai,
    g.total_gaji
FROM pegawai p
JOIN penggajian g
ON p.id_pegawai = g.id_pegawai
WHERE g.total_gaji =
(
    SELECT MAX(total_gaji)
    FROM penggajian
);
*/

-- =========================================================
-- SOAL 6
-- =========================================================

/*
SELECT
    p.nama_pegawai,
    j.nama_jabatan
FROM pegawai p
JOIN jabatan j
ON p.id_jabatan = j.id_jabatan
WHERE p.id_jabatan IN
(
    SELECT id_jabatan
    FROM jabatan
    WHERE nama_jabatan IN ('Supervisor', 'Manager')
);
*/

-- =========================================================
-- SOAL 7
-- =========================================================

/*
SELECT
    p.nama_pegawai,
    a.status_kehadiran
FROM pegawai p
JOIN absensi a
ON p.id_pegawai = a.id_pegawai
WHERE p.id_pegawai IN
(
    SELECT id_pegawai
    FROM absensi
    WHERE tanggal = '2026-05-20'
    AND status_kehadiran = 'Hadir'
)
AND a.tanggal = '2026-05-20';
*/

-- =========================================================
-- SOAL 8
-- =========================================================

/*
SELECT
    nama_proyek,
    jumlah_anggota
FROM
(
    SELECT
        pr.nama_proyek,
        COUNT(dp.id_pegawai) AS jumlah_anggota
    FROM proyek pr
    JOIN detail_proyek dp
    ON pr.id_proyek = dp.id_proyek
    GROUP BY pr.id_proyek
) AS data_proyek
WHERE jumlah_anggota > 2;
*/

-- =========================================================
-- SOAL 9
-- =========================================================

/*
SELECT
    nama_departemen
FROM departemen
WHERE id_departemen IN
(
    SELECT id_departemen
    FROM pegawai
);
*/

-- =========================================================
-- SOAL 10
-- =========================================================

/*
SELECT
    p.nama_pegawai,
    s.nama_status
FROM pegawai p
JOIN status_pegawai s
ON p.id_status = s.id_status
WHERE p.id_status IN
(
    SELECT id_status
    FROM status_pegawai
    WHERE nama_status IN ('Tetap', 'Kontrak')
);
*/

-- =========================================================
-- SOAL 11
-- =========================================================

/*
SELECT
    p.nama_pegawai,
    a.status_kehadiran
FROM pegawai p
JOIN absensi a
ON p.id_pegawai = a.id_pegawai
WHERE EXISTS
(
    SELECT 1
    FROM absensi ab
    WHERE ab.id_pegawai = p.id_pegawai
    AND ab.tanggal = '2026-05-23'
    AND ab.status_kehadiran = 'Hadir'
);
*/

-- =========================================================
-- SOAL 12
-- =========================================================

/*
SELECT
    nama_pegawai
FROM pegawai p
WHERE NOT EXISTS
(
    SELECT 1
    FROM user_login u
    WHERE u.id_pegawai = p.id_pegawai
);
*/

-- =========================================================
-- SOAL 13
-- =========================================================

/*
SELECT
    p.nama_pegawai,
    a.status_kehadiran
FROM pegawai p
JOIN absensi a
ON p.id_pegawai = a.id_pegawai
WHERE EXISTS
(
    SELECT 1
    FROM absensi ab
    WHERE ab.id_pegawai = p.id_pegawai
    AND ab.status_kehadiran = 'Alpha'
)
AND a.status_kehadiran = 'Alpha';
*/

-- =========================================================
-- SOAL 14
-- =========================================================

/*
SELECT
    nama_proyek
FROM proyek pr
WHERE EXISTS
(
    SELECT 1
    FROM detail_proyek dp
    WHERE dp.id_proyek = pr.id_proyek
    AND dp.id_pegawai IN
    (
        SELECT id_pegawai
        FROM pegawai
        WHERE id_departemen =
        (
            SELECT id_departemen
            FROM departemen
            WHERE nama_departemen = 'Information Technology'
        )
    )
);
*/

-- =========================================================
-- SOAL 15
-- =========================================================

/*
SELECT
    nama_pegawai
FROM pegawai p
WHERE NOT EXISTS
(
    SELECT 1
    FROM detail_proyek dp
    WHERE dp.id_pegawai = p.id_pegawai
);
*/

-- =========================================================
-- SOAL 16
-- =========================================================

/*
SELECT
    p.nama_pegawai,
    SUM(g.bonus) AS total_bonus
FROM pegawai p
JOIN penggajian g
ON p.id_pegawai = g.id_pegawai
GROUP BY p.id_pegawai
HAVING SUM(g.bonus) >
(
    SELECT AVG(total_bonus)
    FROM
    (
        SELECT SUM(bonus) AS total_bonus
        FROM penggajian
        GROUP BY id_pegawai
    ) AS data_bonus
);
*/

-- =========================================================
-- SOAL 17
-- =========================================================

/*
SELECT
    nama_proyek,
    budget
FROM proyek
WHERE budget >
(
    SELECT AVG(budget)
    FROM proyek
);
*/

-- =========================================================
-- SOAL 18
-- =========================================================

/*
SELECT
    p.nama_pegawai,
    l.jumlah_jam
FROM pegawai p
JOIN lembur l
ON p.id_pegawai = l.id_pegawai
WHERE l.jumlah_jam =
(
    SELECT MAX(jumlah_jam)
    FROM lembur
);
*/

-- =========================================================
-- SOAL 19
-- =========================================================

/*
SELECT
    nama_departemen,
    jumlah_pegawai
FROM
(
    SELECT
        d.nama_departemen,
        COUNT(p.id_pegawai) AS jumlah_pegawai
    FROM departemen d
    JOIN pegawai p
    ON d.id_departemen = p.id_departemen
    GROUP BY d.id_departemen
) AS data_departemen
WHERE jumlah_pegawai =
(
    SELECT MAX(jumlah_data)
    FROM
    (
        SELECT COUNT(id_pegawai) AS jumlah_data
        FROM pegawai
        GROUP BY id_departemen
    ) AS jumlah
);
*/

-- =========================================================
-- SOAL 20
-- =========================================================

/*
SELECT
    nama_pegawai,
    total_bonus
FROM
(
    SELECT
        p.nama_pegawai,
        SUM(g.bonus) AS total_bonus
    FROM pegawai p
    JOIN penggajian g
    ON p.id_pegawai = g.id_pegawai
    GROUP BY p.id_pegawai
) AS data_bonus
WHERE total_bonus =
(
    SELECT MAX(total_bonus)
    FROM
    (
        SELECT SUM(bonus) AS total_bonus
        FROM penggajian
        GROUP BY id_pegawai
    ) AS bonus_pegawai
);
*/

-- =========================================================
-- SOAL 21
-- =========================================================

/*
SELECT
    p.nama_pegawai,
    d.nama_departemen
FROM pegawai p
JOIN departemen d
ON p.id_departemen = d.id_departemen
WHERE p.id_departemen IN
(
    SELECT id_departemen
    FROM departemen
    WHERE lokasi_kantor = 'Samarinda'
);
*/

-- =========================================================
-- SOAL 22
-- =========================================================

/*
SELECT
    nama_pegawai
FROM pegawai
WHERE id_pegawai IN
(
    SELECT id_pegawai
    FROM detail_proyek
    WHERE id_proyek =
    (
        SELECT id_proyek
        FROM proyek
        WHERE nama_proyek = 'AI Chatbot Internal'
    )
);
*/

-- =========================================================
-- SOAL 23
-- =========================================================

/*
SELECT
    p.nama_pegawai,
    j.nama_jabatan,
    j.gaji_pokok
FROM pegawai p
JOIN jabatan j
ON p.id_jabatan = j.id_jabatan
WHERE p.id_jabatan IN
(
    SELECT id_jabatan
    FROM jabatan
    WHERE gaji_pokok > 10000000
);
*/

-- =========================================================
-- SOAL 24
-- =========================================================

/*
SELECT
    p.nama_pegawai,
    c.jenis_cuti
FROM pegawai p
JOIN cuti c
ON p.id_pegawai = c.id_pegawai
WHERE p.id_pegawai IN
(
    SELECT id_pegawai
    FROM cuti
    WHERE status_persetujuan = 'Disetujui'
);
*/

-- =========================================================
-- SOAL 25
-- =========================================================

/*
SELECT
    p.nama_pegawai,
    pr.nama_proyek
FROM pegawai p
JOIN detail_proyek dp
ON p.id_pegawai = dp.id_pegawai
JOIN proyek pr
ON dp.id_proyek = pr.id_proyek
WHERE dp.id_proyek IN
(
    SELECT id_proyek
    FROM proyek
    WHERE budget > 300000000
);
*/

-- =========================================================
-- SOAL 26
-- =========================================================

/*
SELECT
    p.nama_pegawai,
    g.total_gaji
FROM pegawai p
JOIN penggajian g
ON p.id_pegawai = g.id_pegawai
WHERE g.total_gaji > ALL
(
    SELECT total_gaji
    FROM penggajian
    WHERE id_pegawai IN
    (
        SELECT id_pegawai
        FROM pegawai
        WHERE id_jabatan =
        (
            SELECT id_jabatan
            FROM jabatan
            WHERE nama_jabatan = 'Staff'
        )
    )
);
*/

-- =========================================================
-- SOAL 27
-- =========================================================

/*
SELECT
    nama_pegawai,
    total_bonus
FROM
(
    SELECT
        p.nama_pegawai,
        SUM(g.bonus) AS total_bonus
    FROM pegawai p
    JOIN penggajian g
    ON p.id_pegawai = g.id_pegawai
    GROUP BY p.id_pegawai
) AS data_bonus
WHERE total_bonus > ANY
(
    SELECT SUM(g.bonus)
    FROM pegawai p
    JOIN penggajian g
    ON p.id_pegawai = g.id_pegawai
    WHERE p.id_jabatan =
    (
        SELECT id_jabatan
        FROM jabatan
        WHERE nama_jabatan = 'Manager'
    )
    GROUP BY p.id_pegawai
);
*/

-- =========================================================
-- SOAL 28
-- =========================================================

/*
SELECT
    p.nama_pegawai,
    g.total_gaji
FROM pegawai p
JOIN penggajian g
ON p.id_pegawai = g.id_pegawai
WHERE g.total_gaji > ALL
(
    SELECT total_gaji
    FROM penggajian
    WHERE id_pegawai IN
    (
        SELECT id_pegawai
        FROM pegawai
        WHERE id_jabatan =
        (
            SELECT id_jabatan
            FROM jabatan
            WHERE nama_jabatan = 'Senior Staff'
        )
    )
);
*/

-- =========================================================
-- SOAL 29
-- =========================================================

/*
SELECT
    nama_proyek,
    budget
FROM proyek
WHERE budget > ALL
(
    SELECT budget
    FROM proyek
    WHERE budget < 200000000
);
*/

-- =========================================================
-- SOAL 30
-- =========================================================

/*
SELECT
    p.nama_pegawai,
    l.jumlah_jam
FROM pegawai p
JOIN lembur l
ON p.id_pegawai = l.id_pegawai
WHERE l.jumlah_jam > ALL
(
    SELECT jumlah_jam
    FROM lembur
    WHERE jumlah_jam = 1
);
*/


-- =========================================================
-- SOAL 31
-- =========================================================

/*
SELECT
    p.nama_pegawai,
    g.bulan,
    g.total_gaji
FROM pegawai p
JOIN penggajian g
ON p.id_pegawai = g.id_pegawai
WHERE g.total_gaji =
(
    SELECT MAX(total_gaji)
    FROM penggajian
    WHERE total_gaji <
    (
        SELECT MAX(total_gaji)
        FROM penggajian
    )
);
*/

-- =========================================================
-- SOAL 32
-- =========================================================

/*
SELECT
    nama_proyek,
    jumlah_anggota
FROM
(
    SELECT
        pr.nama_proyek,
        COUNT(dp.id_pegawai) AS jumlah_anggota
    FROM proyek pr
    JOIN detail_proyek dp
    ON pr.id_proyek = dp.id_proyek
    GROUP BY pr.id_proyek
) AS data_proyek
WHERE jumlah_anggota =
(
    SELECT MAX(jumlah)
    FROM
    (
        SELECT COUNT(id_pegawai) AS jumlah
        FROM detail_proyek
        GROUP BY id_proyek
    ) AS jumlah_data
);
*/

-- =========================================================
-- SOAL 33
-- =========================================================

/*
SELECT
    nama_pegawai,
    jumlah_proyek
FROM
(
    SELECT
        p.nama_pegawai,
        COUNT(dp.id_proyek) AS jumlah_proyek
    FROM pegawai p
    JOIN detail_proyek dp
    ON p.id_pegawai = dp.id_pegawai
    GROUP BY p.id_pegawai
) AS data_proyek
WHERE jumlah_proyek >= 2;
*/

-- =========================================================
-- SOAL 34
-- =========================================================

/*
SELECT
    nama_departemen
FROM departemen d
WHERE NOT EXISTS
(
    SELECT 1
    FROM pegawai p
    WHERE p.id_departemen = d.id_departemen
    AND NOT EXISTS
    (
        SELECT 1
        FROM absensi a
        WHERE a.id_pegawai = p.id_pegawai
        AND a.status_kehadiran = 'Hadir'
    )
);
*/

-- =========================================================
-- SOAL 35
-- =========================================================

/*
SELECT
    data_gaji.nama_departemen,
    data_gaji.nama_pegawai,
    data_gaji.bulan,
    data_gaji.total_gaji
FROM
(
    SELECT
        d.nama_departemen,
        p.nama_pegawai,
        g.bulan,
        g.total_gaji,
        p.id_departemen
    FROM pegawai p
    JOIN departemen d
    ON p.id_departemen = d.id_departemen
    JOIN penggajian g
    ON p.id_pegawai = g.id_pegawai
) AS data_gaji
WHERE total_gaji =
(
    SELECT MAX(g2.total_gaji)
    FROM pegawai p2
    JOIN penggajian g2
    ON p2.id_pegawai = g2.id_pegawai
    WHERE p2.id_departemen = data_gaji.id_departemen
);
*/

-- =========================================================
-- SOAL 36
-- =========================================================

/*
SELECT
    nama_pegawai
FROM pegawai p
WHERE NOT EXISTS
(
    SELECT 1
    FROM absensi a
    WHERE a.id_pegawai = p.id_pegawai
    AND a.status_kehadiran = 'Alpha'
);
*/

-- =========================================================
-- SOAL 37
-- =========================================================

/*
SELECT
    nama_pegawai
FROM pegawai p
WHERE EXISTS
(
    SELECT 1
    FROM absensi a
    WHERE a.id_pegawai = p.id_pegawai
)
AND NOT EXISTS
(
    SELECT 1
    FROM absensi a
    WHERE a.id_pegawai = p.id_pegawai
    AND a.status_kehadiran <> 'Hadir'
);
*/

-- =========================================================
-- SOAL 38
-- =========================================================

/*
SELECT
    nama_pegawai
FROM pegawai p
WHERE NOT EXISTS
(
    SELECT 1
    FROM cuti c
    WHERE c.id_pegawai = p.id_pegawai
);
*/

-- =========================================================
-- SOAL 39
-- =========================================================

/*
SELECT
    nama_proyek
FROM proyek pr
WHERE NOT EXISTS
(
    SELECT 1
    FROM detail_proyek dp
    WHERE dp.id_proyek = pr.id_proyek
    AND dp.id_pegawai IN
    (
        SELECT id_pegawai
        FROM pegawai
        WHERE id_departemen =
        (
            SELECT id_departemen
            FROM departemen
            WHERE nama_departemen = 'Information Technology'
        )
    )
);
*/

-- =========================================================
-- SOAL 40
-- =========================================================

/*
SELECT
    nama_pegawai,
    total_bonus
FROM
(
    SELECT
        p.nama_pegawai,
        SUM(g.bonus) AS total_bonus
    FROM pegawai p
    JOIN penggajian g
    ON p.id_pegawai = g.id_pegawai
    GROUP BY p.id_pegawai
) AS data_bonus
WHERE total_bonus =
(
    SELECT MAX(total_bonus)
    FROM
    (
        SELECT SUM(bonus) AS total_bonus
        FROM penggajian
        GROUP BY id_pegawai
    ) AS bonus_pegawai
);
*/