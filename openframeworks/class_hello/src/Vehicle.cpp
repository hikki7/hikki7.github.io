//
//  Vehicle.cpp
//  class_hello
//
//  Created by 引田祐樹 on 2018/10/14.
//

#include "Vehicle.hpp"

Vehicle::Vehicle(float x,float y){
    acceleration=ofVec2f(0,0);
    velocity=ofVec2f(ofRandom(-3,3),ofRandom(-3,3));
    location=ofVec2f(x,y);
}

void Vehicle::update(){
    velocity+=acceleration;
    velocity.limit(maxSpeed);
    location+=velocity;
    acceleration*=0;
}

void Vehicle::applyForce(ofVec2f force){
    acceleration+=force;
}

void Vehicle::bounding(){
    ofVec2f desired=nullptr;
    if(location.x<d){
        desired=ofVec2f(maxSpeed,velocity.y);
    }else if (location.x>ofGetWidth()-d){
        desired=ofVec2f(-maxSpeed,velocity.y);
    }
    
    if(location.y<d){
        desired=ofVec2f(velocity.x, maxSpeed);
    }else if(location.y>ofGetHeight()-d){
        desired=ofVec2f(velocity.x, -maxSpeed);
    }
    
    if(desired!=nullptr){
        desired.normalize();
        desired*maxSpeed;
        ofVec2f steer=ofVec2f(desired-velocity);
        steer.limit(maxForce);
        applyForce(steer);
    }
}

void Vehicle::display(){
    
    
}










