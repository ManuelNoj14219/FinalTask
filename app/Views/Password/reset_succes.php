<?= $this->extend('layouts/default')?>

<?= $this->section('title')?>Restablece la contraseña<?= $this->endSection()?>

<?= $this->section('content')?>

<h1>Restablece la contraseña</h1>

<p>Restablecida con exito</p>

<p><a href="<?= site_url("/login")?>">Login</a></p>

<?= $this->endSection()?>