package pl.maciejk.todoList.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="friendship")
public class Friendship {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	@ManyToOne
    @JoinColumn(name = "invitingUser_id")
	private User invitingUser;
	
	@ManyToOne
    @JoinColumn(name = "invitedUser_id")
	private User invitedUser;
	
    @Column(nullable = false)
    private boolean accepted;
}
