# Telestream Cloud Notifications Ruby SDK

This library provides a low-level interface to the REST API of Telestream Cloud, the online video encoding service.

## Getting Started

## Documentation for API Endpoints

All URIs are relative to *https://api.cloud.telestream.net/notifications/v1.0*

Class | Method | HTTP request | Description
------------ | ------------- | ------------- | -------------
*TelestreamCloud::Notifications::NotificationsApi* | [**create_subscription**](docs/NotificationsApi.md#create_subscription) | **POST** /subscriptions | Create a new subscription
*TelestreamCloud::Notifications::NotificationsApi* | [**delete_subscription**](docs/NotificationsApi.md#delete_subscription) | **DELETE** /subscriptions/{id} | 
*TelestreamCloud::Notifications::NotificationsApi* | [**list_subscriptions**](docs/NotificationsApi.md#list_subscriptions) | **GET** /subscriptions | 


## Documentation for Models

 - [TelestreamCloud::Notifications::Params](docs/Params.md)
 - [TelestreamCloud::Notifications::Subscription](docs/Subscription.md)
 - [TelestreamCloud::Notifications::Topic](docs/Topic.md)


## Documentation for Authorization


### api_key

- **Type**: API key
- **API key parameter name**: X-Api-Key
- **Location**: HTTP header

