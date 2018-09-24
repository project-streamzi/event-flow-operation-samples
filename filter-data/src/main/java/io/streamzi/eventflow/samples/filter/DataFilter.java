/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package io.streamzi.eventflow.samples.filter;

import io.streamzi.cloudevents.CloudEvent;
import io.streamzi.eventflow.annotations.CloudEventComponent;
import io.streamzi.eventflow.annotations.CloudEventConsumer;
import io.streamzi.eventflow.annotations.CloudEventProducer;
import io.streamzi.eventflow.annotations.CloudEventProducerTarget;
import io.streamzi.eventflow.utils.EnvironmentResolver;

import java.util.HashMap;

/**
 * Filters an incoming set of CloudEvents
 * @author hhiden
 */
@CloudEventComponent
public class DataFilter {
    @CloudEventProducer(name = "OUTPUT_DATA")
    CloudEventProducerTarget target;
    
    @CloudEventProducer(name = "REJECTED_DATA")
    CloudEventProducerTarget rejected;
            
    @CloudEventConsumer(name = "INPUT_DATA")
    public void onCloudEvent(CloudEvent evt){
        HashMap <String, String> contents = (HashMap)evt.getData().get();
        Double threshold = Double.parseDouble(EnvironmentResolver.get("threshold"));
        
        if(contents.containsKey("value")){
            Double value = Double.parseDouble(contents.get("value"));
            if(value>threshold){
                // Only send if > threshold
                target.send(evt);
            } else {
                // Reject otherwise
                rejected.send(evt);
            }
        } else {
            target.send(evt);
        }
    }
}
