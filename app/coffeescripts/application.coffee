add_new_choice = () ->
    html = '''
                <input name="multiple_choice_question[choices][][question]" size="30" style="width: 200px" type="text">
                <select name="multiple_choice_question[choices][][correct]">
                    <option value="false">Incorrect</option>
                    <option value="true">Correct</option>
                </select>
                <br />
           '''
    $("#choices").append(html)

$(document).ready ->
    $("#add_question").click ->
        add_new_choice()
        null
