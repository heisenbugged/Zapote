/* DO NOT MODIFY. This file was compiled Mon, 25 Apr 2011 20:14:27 GMT from
 * /Users/jstrong/webapps/EnglishQuiz/app/coffeescripts/application.coffee
 */

(function() {
  var add_new_choice;
  add_new_choice = function() {
    var html;
    html = '<input name="multiple_choice_question[choices][][question]" size="30" style="width: 200px" type="text">\n<select name="multiple_choice_question[choices][][correct]">\n    <option value="false">Incorrect</option>\n    <option value="true">Correct</option>\n</select>\n<br />';
    return $("#choices").append(html);
  };
  1;
  $(document).ready(function() {
    return $("#add_question").click(function() {
      add_new_choice();
      return null;
    });
  });
}).call(this);
