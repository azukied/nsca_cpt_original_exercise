package models;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

@Table(name = "exercises")

@NamedQueries({
    // 該当の章の練習問題を取得
    @NamedQuery(
            name = "getExercisesFromEachChapterId",
            query = "SELECT e FROM Exercise AS e WHERE e.chapter.id = :chapter_id ORDER BY e.id ASC"
            ),
    // 該当の章の練習問題の登録件数を取得
    @NamedQuery(
            name = "getExercisesCountFromEachChapterId",
            query = "SELECT COUNT(e) FROM Exercise AS e WHERE e.chapter.id = :chapter_id"
            )
})

@Entity
public class Exercise {

    @Id
    @Column(name = "id", nullable = false)
    private Integer id;

    @ManyToOne
    @JoinColumn(name = "chapter_id", nullable = false)
    private Chapter chapter;

    @Lob
    @Column(name = "question", nullable = false)
    private String question;

    @Lob
    @Column(name = "choice_a", nullable = false)
    private String choice_a;

    @Lob
    @Column(name = "choice_b", nullable = false)
    private String choice_b;

    @Lob
    @Column(name = "choice_c", nullable = false)
    private String choice_c;

    @Lob
    @Column(name = "choice_d", nullable = false)
    private String choice_d;

    @Column(name = "correct_answer", nullable = false)
    private String correct_answer;

    @Lob
    @Column(name = "explanation", nullable = false)
    private String explanation;


    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Chapter getChapter() {
        return chapter;
    }

    public void setChapter(Chapter chapter) {
        this.chapter = chapter;
    }

    public String getQuestion() {
        return question;
    }

    public void setQuestion(String question) {
        this.question = question;
    }

    public String getChoice_a() {
        return choice_a;
    }

    public void setChoice_a(String choice_a) {
        this.choice_a = choice_a;
    }

    public String getChoice_b() {
        return choice_b;
    }

    public void setChoice_b(String choice_b) {
        this.choice_b = choice_b;
    }

    public String getChoice_c() {
        return choice_c;
    }

    public void setChoice_c(String choice_c) {
        this.choice_c = choice_c;
    }

    public String getChoice_d() {
        return choice_d;
    }

    public void setChoice_d(String choice_d) {
        this.choice_d = choice_d;
    }

    public String getCorrect_answer() {
        return correct_answer;
    }

    public void setCorrect_answer(String correct_answer) {
        this.correct_answer = correct_answer;
    }

    public String getExplanation() {
        return explanation;
    }

    public void setExplanation(String explanation) {
        this.explanation = explanation;
    }

}
