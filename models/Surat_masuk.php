<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "surat_masuk".
 *
 * @property int $id
 * @property string $nomor_agenda
 * @property string $no_surat
 * @property string $surat_dari
 * @property int $instansi_id
 * @property int $is_antar_dinas
 * @property int $kategori_surat_id
 * @property int $sifat_id
 * @property string $no_tindak_lanjut
 * @property string $perihal
 * @property string $tanggal
 * @property string $lampiran
 * @property string $file_surat
 * @property string $file_lampiran
 * @property int $jumlah_lampiran
 * @property int $jabatan_users_id
 */
class Surat_masuk extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'surat_masuk';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id', 'instansi_id', 'kategori_surat_id', 'sifat_id', 'jabatan_users_id'], 'required'],
            [['id', 'instansi_id', 'is_antar_dinas', 'kategori_surat_id', 'sifat_id', 'jumlah_lampiran', 'jabatan_users_id'], 'integer'],
            [['perihal'], 'string'],
            [['tanggal'], 'safe'],
            [['nomor_agenda', 'no_surat', 'surat_dari', 'no_tindak_lanjut', 'lampiran', 'file_surat', 'file_lampiran'], 'string', 'max' => 45],
            [['id'], 'unique'],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'nomor_agenda' => 'Nomor Agenda',
            'no_surat' => 'No Surat',
            'surat_dari' => 'Surat Dari',
            'instansi_id' => 'Instansi ID',
            'is_antar_dinas' => 'Is Antar Dinas',
            'kategori_surat_id' => 'Kategori Surat ID',
            'sifat_id' => 'Sifat ID',
            'no_tindak_lanjut' => 'No Tindak Lanjut',
            'perihal' => 'Perihal',
            'tanggal' => 'Tanggal',
            'lampiran' => 'Lampiran',
            'file_surat' => 'File Surat',
            'file_lampiran' => 'File Lampiran',
            'jumlah_lampiran' => 'Jumlah Lampiran',
            'jabatan_users_id' => 'Jabatan Users ID',
        ];
    }
}
