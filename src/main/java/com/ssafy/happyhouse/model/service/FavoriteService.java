package com.ssafy.happyhouse.model.service;

import java.util.List;

import com.ssafy.happyhouse.model.dto.Favorite;

public interface FavoriteService {
	void addFavorite(Favorite fav);
	void removeFavorite(int no);
	List<Favorite> getFavorite(int userno);
}
