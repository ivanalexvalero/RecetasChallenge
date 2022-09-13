//
//  NetworkError.swift
//  RecetasChallenge
//
//  Created by Ivan Valero on 13/09/2022.
//

import Foundation

enum NetworkError: String, Error {
    case invalidURL
    case serializationFailed
    case generic
    case couldNotDecodeData
    case httpResponseError
    case statusCodeError = "Ocurrio un error al tratar de consultar la API: Status code"
    case jsonDecoder = "Error al intentar extraer datos del json"
    case unauthorized
}
