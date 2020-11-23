package models;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

@Table(name = "exercises")

//@NamedQueries({
//    //
//    @NamedQuery(
//            name = "",
//            query = ""
//            )
//})

@Entity
public class Exercise {

    @Id
    @Column(name = "id", nullable = false)
    private Integer id;

    @ManyToOne
    @JoinColumn(name = "chapter_id", nullable = false)
    private Chapter chapter;

    @Column(name = "question", nullable = false)
    private String question;

    @Column(name = "choice_a")
    private String choice_a;

    @Column(name = "choice_b")
    private String choice_b;

    @Column(name = "choice_c")
    private String choice_c;

    @Column(name = "choice_d")
    private String choice_d;

    @Column(name = "explanation")
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

    public String getExplanation() {
        return explanation;
    }

    public void setExplanation(String explanation) {
        this.explanation = explanation;
    }

}
