<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Liste des Hôtels</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <style>
        /* Boutons verts pour tous les boutons dans le tableau */
        .btn-table {
            background-color: #28a745;
            color: #fff;
        }
    </style>
</head>
<body>

<div class="container mt-5">
    <!-- Tableau des hôtels -->
    <h1>Liste des hôtels :</h1>
    <table class="table">
        <thead>
            <tr>
                <th>ID</th>
                <th>Nom de l'Hôtel</th>
                <th>Adresse</th>
                <th>Téléphone</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${hotels}" var="hotel">
                <tr>
                    <td>${hotel.id}</td>
                    <td>${hotel.nom}</td>
                    <td>${hotel.adresse}</td>
                    <td>${hotel.telephone}</td>
                    <td>
                        <a href="hotelController?action=delete&id=${hotel.id}" class="btn btn-table btn-sm">Supprimer</a>
                        <a href="hotelController?action=update&id=${hotel.id}" class="btn btn-table btn-sm">Modifier</a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>

<!-- Bootstrap JS and Popper.js -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

</body>
</html>
