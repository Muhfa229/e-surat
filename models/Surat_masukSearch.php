<?php

namespace app\models;

use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\models\Surat_masuk;

/**
 * Surat_masukSearch represents the model behind the search form of `app\models\Surat_masuk`.
 */
class Surat_masukSearch extends Surat_masuk
{
    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id', 'instansi_id', 'is_antar_dinas', 'kategori_surat_id', 'sifat_id', 'jumlah_lampiran', 'jabatan_users_id'], 'integer'],
            [['nomor_agenda', 'no_surat', 'surat_dari', 'no_tindak_lanjut', 'perihal', 'tanggal', 'lampiran', 'file_surat', 'file_lampiran'], 'safe'],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function scenarios()
    {
        // bypass scenarios() implementation in the parent class
        return Model::scenarios();
    }

    /**
     * Creates data provider instance with search query applied
     *
     * @param array $params
     *
     * @return ActiveDataProvider
     */
    public function search($params)
    {
        $query = Surat_masuk::find();

        // add conditions that should always apply here

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
        ]);

        $this->load($params);

        if (!$this->validate()) {
            // uncomment the following line if you do not want to return any records when validation fails
            // $query->where('0=1');
            return $dataProvider;
        }

        // grid filtering conditions
        $query->andFilterWhere([
            'id' => $this->id,
            'instansi_id' => $this->instansi_id,
            'is_antar_dinas' => $this->is_antar_dinas,
            'kategori_surat_id' => $this->kategori_surat_id,
            'sifat_id' => $this->sifat_id,
            'tanggal' => $this->tanggal,
            'jumlah_lampiran' => $this->jumlah_lampiran,
            'jabatan_users_id' => $this->jabatan_users_id,
        ]);

        $query->andFilterWhere(['like', 'nomor_agenda', $this->nomor_agenda])
            ->andFilterWhere(['like', 'no_surat', $this->no_surat])
            ->andFilterWhere(['like', 'surat_dari', $this->surat_dari])
            ->andFilterWhere(['like', 'no_tindak_lanjut', $this->no_tindak_lanjut])
            ->andFilterWhere(['like', 'perihal', $this->perihal])
            ->andFilterWhere(['like', 'lampiran', $this->lampiran])
            ->andFilterWhere(['like', 'file_surat', $this->file_surat])
            ->andFilterWhere(['like', 'file_lampiran', $this->file_lampiran]);

        return $dataProvider;
    }
}
