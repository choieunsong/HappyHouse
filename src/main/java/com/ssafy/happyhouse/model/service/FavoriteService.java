package com.ssafy.happyhouse.model.service;

import java.util.List;

import com.ssafy.happyhouse.model.dto.Favorite;

public interface FavoriteService {
	boolean addFavorite(Favorite fav);
	boolean removeFavorite(int no);
	List<Favorite> getFavorite(int userno);
	List<Favorite> getFavoriteAptInfo(int userno);
}
