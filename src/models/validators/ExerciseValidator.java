package models.validators;

import java.util.ArrayList;
import java.util.List;

import models.Chapter;
import models.Exercise;

public class ExerciseValidator {

    // バリデーションを実行
    public static List<String> validate(Exercise e) {
        List<String> errors = new ArrayList<String>();

        String id_error = _validateId(e.getId());
        if (!id_error.equals("")) {
            errors.add(id_error);
        }

        String chapter_id_error = _validateChapter(e.getChapter());
        if (!chapter_id_error.equals("")) {
            errors.add(chapter_id_error);
        }

        String question_error = _validateQuestion(e.getQuestion());
        if (!question_error.equals("")) {
            errors.add(question_error);
        }

        String choice_a_error = _validateChoiceA(e.getChoice_a());
        if (!choice_a_error.equals("")) {
            errors.add(choice_a_error);
        }

        String choice_b_error = _validateChoiceB(e.getChoice_b());
        if (!choice_b_error.equals("")) {
            errors.add(choice_b_error);
        }

        String choice_c_error = _validateChoiceC(e.getChoice_c());
        if (!choice_c_error.equals("")) {
            errors.add(choice_c_error);
        }

        String choice_d_error = _validateChoiceD(e.getChoice_d());
        if (!choice_d_error.equals("")) {
            errors.add(choice_d_error);
        }

        String correct_answer_error = _validateCorrectAnswer(e.getCorrect_answer());
        if (!correct_answer_error.equals("")) {
            errors.add(correct_answer_error);
        }

        String explanation_error = _validateExplanation(e.getExplanation());
        if (!explanation_error.equals("")) {
            errors.add(explanation_error);
        }

        return errors;
    }

    // 問題番号の必須入力チェック
    private static String _validateId(Integer id) {
        if (id == null || id.equals("")) {
            return "問題番号を入力してください。";
        }

        return "";
    }

    // 章番号の必須入力チェック
    private static String _validateChapter(Chapter chapter) {
        if (chapter == null || chapter.equals("")) {
            return "章番号を入力してください。";
        }

        return "";
    }

    // 問題文の必須入力チェック
    private static String _validateQuestion(String question) {
        if (question == null || question.equals("")) {
            return "問題文を入力してください。";
        }

        return "";
    }

    // 選択肢Aの必須入力チェック
    private static String _validateChoiceA(String choice_a) {
        if (choice_a == null || choice_a.equals("")) {
            return "選択肢Aを入力してください。";
        }

        return "";
    }

    // 選択肢Bの必須入力チェック
    private static String _validateChoiceB(String choice_b) {
        if (choice_b == null || choice_b.equals("")) {
            return "選択肢Bを入力してください。";
        }

        return "";
    }

    // 選択肢Cの必須入力チェック
    private static String _validateChoiceC(String choice_c) {
        if (choice_c == null || choice_c.equals("")) {
            return "選択肢Cを入力してください。";
        }

        return "";
    }

    // 選択肢Dの必須入力チェック
    private static String _validateChoiceD(String choice_d) {
        if (choice_d == null || choice_d.equals("")) {
            return "選択肢Dを入力してください。";
        }

        return "";
    }

    // 正解の必須入力チェック
    private static String _validateCorrectAnswer(String correct_answer) {
        if (correct_answer == null || correct_answer.equals("")) {
            return "正解を入力してください。";
        }

        return "";
    }

    // 解説文の必須入力チェック
    private static String _validateExplanation(String explanation) {
        if (explanation == null || explanation.equals("")) {
            return "解説文を入力してください。";
        }

        return "";
    }

}
