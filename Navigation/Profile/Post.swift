//
//  Post.swift
//  Navigation
//
//  Created by Stas Kupriyanov on 18.11.2023.
//

import Foundation

struct Post {
    let author: String
    let description: String
    let image: String
    let likes: Int
    let views: Int
}

let arrPosts: [Post] = [
    Post(
        author: "Дмитрий Ржевской",
        description: "Почему олень всегда выигрывает в карты? \nПотому что он отлично держит руку!",
        image: "deer",
        likes: 203,
        views: 301
    ),
    Post(
        author: "Наташа Хомякова",
        description: "Почему хомяк всегда хорошо знает математику? \nПотому что он отлично считается с каждым орешком!",
        image: "hamster",
        likes: 48,
        views: 114
    ),
    Post(
        author: "Владимир Птицевич",
        description: "Почему птицы никогда не опаздывают? \nПотому что они всегда взлетают вовремя!",
        image: "bird",
        likes: 199,
        views: 200
    ),
    Post(
        author: "Денис Драконов",
        description: "Почему дракон никогда не вступает в споры? \nПотому что он всегда огненно убеждает!",
        image: "dragon",
        likes: 2,
        views: 7
    )
]
