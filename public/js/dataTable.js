$(document).ready(function() {
    $('#table-backoffice-user').DataTable({
        language: {
            url: '/js/dataTables.french.json'
        },
        "aoColumnDefs": [
            { 'bSortable': false, 'aTargets': [ 8 , 9 , 10 , 11 ] }
        ]
    });

    $('#table-backoffice-produit').DataTable({
        language: {
            url: '/js/dataTables.french.json'
        },
        "aoColumnDefs": [
            { 'bSortable': false, 'aTargets': [ 0 , 4 , 5 , 6 ] }
        ]
    });

    $('#table-backoffice-category').DataTable({
        language: {
            url: '/js/dataTables.french.json'
        },
        "aoColumnDefs": [
            { 'bSortable': false, 'aTargets': [ 1 ] }
        ]
    });

    $('#table-backoffice-format').DataTable({
        language: {
            url: '/js/dataTables.french.json'
        },
        "aoColumnDefs": [
            { 'bSortable': false, 'aTargets': [ 4 ] }
        ]
    });

    $('#table-backoffice-commentaire').DataTable({
        language: {
            url: '/js/dataTables.french.json'
        },
        "aoColumnDefs": [
            { 'bSortable': false, 'aTargets': [ 4 ] },
            {"targets":3, "type":"date"}
        ]
    });

    $('#table-backoffice-commande').DataTable({
        language: {
            url: '/js/dataTables.french.json'
        },
        "aoColumnDefs": [
            { 'bSortable': false, 'aTargets': [ 5 ] },
            {"targets":3, "type":"date"}
        ]
        
    });

    $('#table-backoffice-promo').DataTable({
        language: {
            url: '/js/dataTables.french.json'
        },
        "aoColumnDefs": [
            { 'bSortable': false, 'aTargets': [ 6 ] },
            {"targets":3, "type":"date"},
            {"targets":4, "type":"date"}
        ]
        
    });
});
