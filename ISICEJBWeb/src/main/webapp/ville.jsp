<%@page import="entities.Ville"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Liste des Villes</title>
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
    <!-- Bouton pour rediriger vers hotel.jsp avec une classe de marge -->
    <a href="hotel.jsp" class="btn btn-table ml-2 mt-3">Gestion des Hotels</a>

    <!-- Formulaire d'ajout avec une classe de marge -->
    <form action="VilleController" method="post" class="form-inline mb-3 mt-3">
        <div class="form-group">
            <label for="ville">Nom :</label>
            <input type="text" name="ville" class="form-control ml-2" />
        </div>
        <input type="hidden" name="action" value="create" />
        <button type="submit" class="btn btn-table ml-2">Enregistrer</button>
    </form>

    <!-- Liste des villes -->
    <h1>Liste des villes :</h1>
    <table class="table">
        <thead>
            <tr>
                <th>ID</th>
                <th>Nom de la Ville</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${villes}" var="v">
                <tr>
                    <td>${v.id}</td>
                    <td>${v.nom}</td>
                    <td>
                        <a href="VilleController?action=delete&id=${v.id}" class="btn btn-table btn-sm">Supprimer</a>
                        <a href="update.jsp?id=${v.id}" class="btn btn-table btn-sm">Modifier</a>
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
