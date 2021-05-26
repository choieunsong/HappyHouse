package com.ssafy.happyhouse.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ssafy.happyhouse.model.dto.Favorite;

@Mapper
public interface FavoriteDAO {
	public int addFavorite(Favorite fav);
	public int removeFavorite(int no);
	public List<Favorite> getFavorite(int userno);
	public List<Favorite> getFavoriteAptInfo(int userno);
}
