$(function () {
   
    $('#btnEdit').bind('click', function () {
        $.messager.confirm('系统提示', '确定修改此项内容?',
            function (YesOrNO) {
                if (YesOrNO) {
                    updateNote();
                }
            }
        );
    });
    $('#btnAdd').bind('click', function () {
        $.messager.confirm('系统提示', '确定增加此项内容?',
            function (YesOrNO) {
                if (YesOrNO) {
                    addNote();
                }
            }
        );
    });
    $('#btnDelete').bind('click', function () {
        deleteNote();
    });
});

function editNote(strID, strTitle, strNote, strCreatDate, strCreator) {
    $('#ID').val(strID);
    $('#txtTitle').val(strTitle);
    $('#txtNote').val(strNote);
    $('#txtDate').datebox('setvalue',strCreatDate);   
}
function updateNote() {
    var strupID = $('#ID').val().toString();
    var strupTitle = $('#txtTitle').val().toString();
    var strupNote = $('#txtNote').val().toString();  
    var strupDate = $('#txtDate').val().toString();
   
    if (strupID == '') {
        $.messager.alert("修改错误", "请选择修改项目！", "warning");
    } else {
        $.post('../ashx/editNote.ashx',
        {
            'flag': 'update',
            'ID': strupID,
            'Title': strupTitle,
            'Note': strupNote,
            'Date': strupDate            
        },
        function (Return) {
            if (Return == "OK") {
                alert("修改成功！");
                location.reload();
            }
        }
    );
    }
}
function addNote() {
    var straddID = $('#ID').val().toString();
    var straddTitle = $('#txtTitle').val().toString();
    var straddNote = $('#txtNote').val().toString();
    var straddDate = $('#txtDate').datebox("getValue").toString();
    if (straddTitle == '' || straddNote == '' ) {
        $.messager.alert("新增错误", "请填好新增项目内容！", "warning");
    } else {
        $.post('../ashx/editNote.ashx',
        {
            'flag': 'add',
            'Title': straddTitle,
            'Note': straddNote,
            'Date': straddDate
        },
        function (Return) {
            if (Return == "OK") {
                alert("新增通知成功！");
                location.reload();
            }
        }
    );
    }
}

function deleteNote() {
    var chk = $('tbody>tr>td').find(':checkbox')
    var chked = chk.filter(':checked');

    if (chked.length == 0) {
        $.messager.alert("删除错误", "请选择删除项目！", "warning");
    }
    else {

        $.messager.confirm('系统提示', '您確定刪除嗎?',
                                            function (YesOrNO) {

                                                if (YesOrNO) {
                                                    getKeyValue(chked);
                                                }
                                            }
                                       );
    }
}

function getKeyValue(strChked) {
    var strdelID = strChked[0].parentNode.nextSibling.innerHTML;
    for (i = 1; i < strChked.length; i++) {
        strdelID += "-" + strChked[i].parentNode.nextSibling.innerHTML;
    }

    $.post('../ashx/editNote.ashx',
        {
            'flag': 'delete',
            'delID': strdelID
        },
        function (Return) {
            if (Return == "OK") {
                alert("删除车次成功！");
                location.reload();
            }
        }
    );
}