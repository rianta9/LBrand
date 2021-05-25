/**
 * 
 */
package com.rianta9.entity;

import java.util.Date;
import java.util.List;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.CreationTimestamp;

import com.rianta9.util.DateTimeUtil;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

/**
 * @author rianta9
 * @datecreated 15 thg 4, 2021 21:16:05
 */
@Getter
@Setter
@NoArgsConstructor
@Entity
public class Comment {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(columnDefinition = "bigint")
	private Long commentId;
	
	@Column(nullable = false)
	private String commentContent;
	
	@Basic
	@CreationTimestamp
	@Temporal(TemporalType.TIMESTAMP)
	private Date dateCreated;
	
	@ManyToOne
	@JoinColumn(name = "parents_comment_id")
	private Comment parentsComment;
	
	@ManyToOne
	@JoinColumn(name = "account_id", nullable = false)
	private Account account;
	
	@OneToMany(mappedBy = "comment")
	private List<CommentImage> listCommentImage;
	
	@OneToMany(mappedBy = "parentsComment")
	private List<Comment> listChildrenComment;
	
	public String getStringDateCreated() {
		return DateTimeUtil.toStringType(this.dateCreated);
	}
}
