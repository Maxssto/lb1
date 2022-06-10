<?php
$db = new PDO("mysql:host=127.0.0.1;dbname=hospital", "root", "");
require_once __DIR__ . "/tmp.php";
?>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Maxim</title>
</head>
<body>
<?php
if (isset($_POST["nurse"])) {
    findWards($db, $_POST["nurse"]);
} elseif (isset($_POST["ward"])) {
    findNurses($db, $_POST["ward"]);
} elseif (isset($_POST["shift"])) {
    findShift($db, $_POST["shift"]);
} elseif (isset($_POST["name"])) {
    addNurse($db, $_POST["name"], $_POST["date"], $_POST["department"], $_POST["addShift"]);
} elseif (isset($_POST["addWard"])) {
    addWard($db, $_POST["addWard"]);
} elseif (isset($_POST["FID_Nurse"])) {
    addNurseWard($db, $_POST["FID_Nurse"], $_POST["FID_Ward"]);
}
?>
<br>
<form action="" method="post">
    <select name="nurse">
        <?php
        showNurses($db);
        ?>
    </select>
    <input type="submit" value="Enter"><br>
</form>
<br>
<form action="" method="post">
    <select name="ward">
        <?php
        showWards($db);
        ?>
    </select>
    <input type="submit" value="Enter"><br>
</form>
<br>
<form action="" method="post">
    <select name="shift">
        <option value="First">First</option>
        <option value="Second">Second</option>
        <option value="Third">Third</option>
    </select>
    <input type="submit" value="Enter"><br>
</form>
<br>
<form action="" method="post">
    <input type="text" name="name" placeholder="Add Nurse Name"><br>
    <input type="date" name="date" placeholder="Add Nurse Date"><br>
    <input type="text" name="department" placeholder="Add Nurse Department"><br>
    <input type="text" name="addShift" placeholder="Add Nurse Shift"><br>
    <input type="submit" value="Enter"><br>
</form>
<br>
<form action="" method="post">
    <input type="number" name="addWard" placeholder="Add Ward"><br>
    <input type="submit" value="Enter"><br>
</form>
<br>
<form action="" method="post">
    <input type="text" name="FID_Nurse" placeholder="Add Nurse"><br>
    <input type="text" name="FID_Ward" placeholder="Add Ward"><br>
    <input type="submit" value="Enter"><br>
</form>
</body>
</html>
