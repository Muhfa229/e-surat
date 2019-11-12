<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\Surat_masukSearch */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="surat-masuk-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
    ]); ?>

    <?= $form->field($model, 'id') ?>

    <?= $form->field($model, 'nomor_agenda') ?>

    <?= $form->field($model, 'no_surat') ?>

    <?= $form->field($model, 'surat_dari') ?>

    <?= $form->field($model, 'instansi_id') ?>

    <?php // echo $form->field($model, 'is_antar_dinas') ?>

    <?php // echo $form->field($model, 'kategori_surat_id') ?>

    <?php // echo $form->field($model, 'sifat_id') ?>

    <?php // echo $form->field($model, 'no_tindak_lanjut') ?>

    <?php // echo $form->field($model, 'perihal') ?>

    <?php // echo $form->field($model, 'tanggal') ?>

    <?php // echo $form->field($model, 'lampiran') ?>

    <?php // echo $form->field($model, 'file_surat') ?>

    <?php // echo $form->field($model, 'file_lampiran') ?>

    <?php // echo $form->field($model, 'jumlah_lampiran') ?>

    <?php // echo $form->field($model, 'jabatan_users_id') ?>

    <div class="form-group">
        <?= Html::submitButton('Search', ['class' => 'btn btn-primary']) ?>
        <?= Html::resetButton('Reset', ['class' => 'btn btn-outline-secondary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
