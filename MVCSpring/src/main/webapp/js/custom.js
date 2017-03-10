$('#updateUser').on('show', function() {
    var id = $(this).data('id');
    console.log("update id:" + id);
    $.get(
        "/update/"+id,
        function(data) {
            alert('page content: ' + data);
        }
    );
})

$('.updateUser').on('click', function(e) {
    e.preventDefault();

    var id = $(this).data('id');


    $.get(
        "/update/"+id,
        function(data) {
            console.log(data);
            $("#updateUser .modal-body #id").val(data.id);
            $("#updateUser .modal-body #username").val(data.username);
            $("#updateUser .modal-body #firstName").val(data.firstName);
            $("#updateUser .modal-body #lastName").val(data.lastName);
            $("#updateUser .modal-body #phoneNumberUpdate").val(data.phoneNumber);
            $('#updateUser').data('id', id).modal('show');
        }
    );
});

$('#confirm').on('show', function() {
    var id = $(this).data('id'),
        removeBtn = $(this).find('.danger');
    console.log("confirm id:" + id);
})

$('.confirm-delete').on('click', function(e) {
    e.preventDefault();

    var id = $(this).data('id');
    $('#confirm').data('id', id).modal('show');
});

$('#btnYes').click(function() {
    // handle deletion here
    var id = $('#confirm').data('id');
    $.get(
        "/delete/"+id
    );
    $('#confirm').modal('hide');
    window.location = "/";
});