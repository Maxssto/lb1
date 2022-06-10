<?php

function showNurses(PDO $db)
{
    $statement = $db->query("SELECT DISTINCT name FROM nurse");
    while ($data = $statement->fetch()) {
        echo "<option value='$data[0]'>$data[0]</option>";
    }
}

function showWards(PDO $db)
{
    $statement = $db->query("SELECT DISTINCT ID_Ward FROM ward");
    while ($data = $statement->fetch()) {
        echo "<option value='$data[0]'>$data[0]</option>";
    }
}

function findWards($db, $nurse)
{
    $statement = $db->prepare("SELECT ID_Ward FROM ward INNER JOIN nurse_ward ON ID_Ward = FID_Ward INNER JOIN nurse ON FID_Nurse = ID_Nurse WHERE name=?");
    $statement->execute([$nurse]);
    echo "<b>Wards:</b>";
    while ($data = $statement->fetch()) {
        echo "<br>{$data['ID_Ward']}";
    }
}

function findNurses($db, $ward)
{
    $statement = $db->prepare("SELECT name FROM ward INNER JOIN nurse_ward ON ID_Ward = FID_Ward INNER JOIN nurse ON FID_Nurse = ID_Nurse WHERE ID_Ward=?");
    $statement->execute([$ward]);
    echo "<b>Nurses:</b>";
    while ($data = $statement->fetch()) {
        echo "<br>{$data['name']}";
    }
}

function findShift($db, $shift)
{
    $statement = $db->prepare("SELECT name, `date`, department, shift, GROUP_CONCAT(ID_Ward SEPARATOR ' ') AS 'ward'
FROM ward INNER JOIN nurse_ward ON ID_Ward = FID_Ward INNER JOIN nurse ON FID_Nurse = ID_Nurse 
WHERE shift=?
GROUP BY name");
    $statement->execute([$shift]);
    echo "<b>Shifts:</b>";
    while ($data = $statement->fetch()) {
        echo "<br>{Name - {$data['name']}} {Date - {$data['date']}} {Department - {$data['department']}} {Ward - {$data['ward']}}";
    }
}

function addNurse($db, $name, $date, $department, $shift)
{
    $statement = $db->prepare("INSERT INTO nurse (name, `date`, department, shift) VALUES (?, ?, ?, ?)");
    $statement->execute([$name, $date, $department, $shift]);
}

function addWard($db, $ward)
{
    $statement = $db->prepare("INSERT INTO ward (ID_Ward) VALUES (?)");
    $statement->execute([$ward]);
}

function addNurseWard($db, $FID_Nurse, $FID_Ward)
{
    $statement = $db->prepare("INSERT INTO nurse_ward (FID_Nurse, FID_Ward) VALUES (?, ?)");
    $statement->execute([$FID_Nurse, $FID_Ward]);
}

