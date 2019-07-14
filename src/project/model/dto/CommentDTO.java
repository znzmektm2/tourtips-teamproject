package project.model.dto;

public class CommentDTO {
	private int commentId;
	private String placeId;
	private String userId;
	private String context;
	private int rating;
	private String dateCreated;

	public CommentDTO() {
	}
	
	public CommentDTO(String placeId, int rating) {
		this.placeId = placeId;
		this.rating = rating;
	}

	public CommentDTO(int commentId, String placeId, String userId, String context, int rating, String dateCreated) {
		this.commentId = commentId;
		this.placeId = placeId;
		this.userId = userId;
		this.context = context;
		this.rating = rating;
		this.dateCreated = dateCreated;
	}

	public int getCommentId() {
		return commentId;
	}

	public void setCommentId(int commentId) {
		this.commentId = commentId;
	}

	public String getPlaceId() {
		return placeId;
	}

	public void setPlaceId(String placeId) {
		this.placeId = placeId;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getContext() {
		return context;
	}

	public void setContext(String context) {
		this.context = context;
	}

	public int getRating() {
		return rating;
	}

	public void setRating(int rating) {
		this.rating = rating;
	}

	public String getDateCreated() {
		return dateCreated;
	}

	public void setDateCreated(String dateCreated) {
		this.dateCreated = dateCreated;
	}

	@Override
	public String toString() {
		return "CommentDTO [commentId=" + commentId + ", placeId=" + placeId + ", userId=" + userId + ", context="
				+ context + ", rating=" + rating + ", dateCreated=" + dateCreated + "]";
	}
}