# frozen_string_literal: true

module ApolloDeploySignalSdkRails
  # Schema type: AttachmentRequest
  class AttachmentRequest
    # @return [String]
    attr_accessor :filename
    # @return [String]
    attr_accessor :content
    # @return [String]
    attr_accessor :content_type
    # @return [String]
    attr_accessor :disposition
    # @return [String, nil]
    attr_accessor :content_id

    # @param filename [String], content [String], content_type [String], disposition [String], content_id [String, nil]
    def initialize(filename: , content: , content_type: , disposition: nil, content_id: nil)
      @filename = filename
      @content = content
      @content_type = content_type
      @disposition = disposition
      @content_id = content_id
    end

    # @return [Hash] a hash representation of this object
    def to_h
      {
        filename: @filename,
        content: @content,
        content_type: @content_type,
        disposition: @disposition,
        content_id: @content_id,
      }.compact
    end

    # Create an instance from a parsed JSON hash.
    # @param attributes [Hash]
    # @return [AttachmentRequest]
    def self.from_json(attributes)
      return nil unless attributes.is_a?(Hash)

      new(
        filename: attributes.key?("filename") ? attributes["filename"] : attributes[:filename],
        content: attributes.key?("content") ? attributes["content"] : attributes[:content],
        content_type: attributes.key?("contentType") ? attributes["contentType"] : attributes[:content_type],
        disposition: attributes.key?("disposition") ? attributes["disposition"] : attributes[:disposition],
        content_id: attributes.key?("contentId") ? attributes["contentId"] : attributes[:content_id],
      )
    end
  end

  # Schema type: DeliveryWindowRequest
  class DeliveryWindowRequest
    # @return [String]
    attr_accessor :start
    # @return [String]
    attr_accessor :end_

    # @param start [String], end_ [String]
    def initialize(start: , end_: )
      @start = start
      @end_ = end_
    end

    # @return [Hash] a hash representation of this object
    def to_h
      {
        start: @start,
        end_: @end_,
      }.compact
    end

    # Create an instance from a parsed JSON hash.
    # @param attributes [Hash]
    # @return [DeliveryWindowRequest]
    def self.from_json(attributes)
      return nil unless attributes.is_a?(Hash)

      new(
        start: attributes.key?("start") ? attributes["start"] : attributes[:start],
        end_: attributes.key?("end") ? attributes["end"] : attributes[:end_],
      )
    end
  end

  # Schema type: TrackingSettingsRequest
  class TrackingSettingsRequest
    # @return [Boolean, nil]
    attr_accessor :open_tracking
    # @return [Boolean, nil]
    attr_accessor :click_tracking
    # @return [Boolean, nil]
    attr_accessor :unsubscribe_tracking
    # @return [Boolean, nil]
    attr_accessor :read_engagement

    # @param open_tracking [Boolean, nil], click_tracking [Boolean, nil], unsubscribe_tracking [Boolean, nil], read_engagement [Boolean, nil]
    def initialize(open_tracking: nil, click_tracking: nil, unsubscribe_tracking: nil, read_engagement: nil)
      @open_tracking = open_tracking
      @click_tracking = click_tracking
      @unsubscribe_tracking = unsubscribe_tracking
      @read_engagement = read_engagement
    end

    # @return [Hash] a hash representation of this object
    def to_h
      {
        open_tracking: @open_tracking,
        click_tracking: @click_tracking,
        unsubscribe_tracking: @unsubscribe_tracking,
        read_engagement: @read_engagement,
      }.compact
    end

    # Create an instance from a parsed JSON hash.
    # @param attributes [Hash]
    # @return [TrackingSettingsRequest]
    def self.from_json(attributes)
      return nil unless attributes.is_a?(Hash)

      new(
        open_tracking: attributes.key?("openTracking") ? attributes["openTracking"] : attributes[:open_tracking],
        click_tracking: attributes.key?("clickTracking") ? attributes["clickTracking"] : attributes[:click_tracking],
        unsubscribe_tracking: attributes.key?("unsubscribeTracking") ? attributes["unsubscribeTracking"] : attributes[:unsubscribe_tracking],
        read_engagement: attributes.key?("readEngagement") ? attributes["readEngagement"] : attributes[:read_engagement],
      )
    end
  end

  # Schema type: SendEmailRequest
  class SendEmailRequest
    # @return [String]
    attr_accessor :from
    # @return [Array<String>]
    attr_accessor :to
    # @return [Array<String>]
    attr_accessor :cc
    # @return [Array<String>]
    attr_accessor :bcc
    # @return [String, nil]
    attr_accessor :reply_to
    # @return [String, nil]
    attr_accessor :subject
    # @return [String, nil]
    attr_accessor :html
    # @return [String, nil]
    attr_accessor :text
    # @return [Hash{String => String}]
    attr_accessor :tags
    # @return [Hash{String => String}]
    attr_accessor :metadata
    # @return [String, nil]
    attr_accessor :idempotency_key
    # @return [Boolean]
    attr_accessor :test_mode
    # @return [Array<AttachmentRequest>]
    attr_accessor :attachments
    # @return [String, nil]
    attr_accessor :scheduled_at
    # @return [DeliveryWindowRequest, nil]
    attr_accessor :delivery_window
    # @return [String]
    attr_accessor :send_time_category
    # @return [TrackingSettingsRequest, nil]
    attr_accessor :tracking_settings

    # @param from [String], to [Array<String>], cc [Array<String>], bcc [Array<String>], reply_to [String, nil], subject [String, nil], html [String, nil], text [String, nil], tags [Hash{String => String}], metadata [Hash{String => String}], idempotency_key [String, nil], test_mode [Boolean], attachments [Array<AttachmentRequest>], scheduled_at [String, nil], delivery_window [DeliveryWindowRequest, nil], send_time_category [String], tracking_settings [TrackingSettingsRequest, nil]
    def initialize(from: , to: , cc: nil, bcc: nil, reply_to: nil, subject: nil, html: nil, text: nil, tags: nil, metadata: nil, idempotency_key: nil, test_mode: nil, attachments: nil, scheduled_at: nil, delivery_window: nil, send_time_category: nil, tracking_settings: nil)
      @from = from
      @to = to
      @cc = cc
      @bcc = bcc
      @reply_to = reply_to
      @subject = subject
      @html = html
      @text = text
      @tags = tags
      @metadata = metadata
      @idempotency_key = idempotency_key
      @test_mode = test_mode
      @attachments = attachments
      @scheduled_at = scheduled_at
      @delivery_window = delivery_window
      @send_time_category = send_time_category
      @tracking_settings = tracking_settings
    end

    # @return [Hash] a hash representation of this object
    def to_h
      {
        from: @from,
        to: @to,
        cc: @cc,
        bcc: @bcc,
        reply_to: @reply_to,
        subject: @subject,
        html: @html,
        text: @text,
        tags: @tags,
        metadata: @metadata,
        idempotency_key: @idempotency_key,
        test_mode: @test_mode,
        attachments: @attachments,
        scheduled_at: @scheduled_at,
        delivery_window: @delivery_window,
        send_time_category: @send_time_category,
        tracking_settings: @tracking_settings,
      }.compact
    end

    # Create an instance from a parsed JSON hash.
    # @param attributes [Hash]
    # @return [SendEmailRequest]
    def self.from_json(attributes)
      return nil unless attributes.is_a?(Hash)

      new(
        from: attributes.key?("from") ? attributes["from"] : attributes[:from],
        to: attributes.key?("to") ? attributes["to"] : attributes[:to],
        cc: attributes.key?("cc") ? attributes["cc"] : attributes[:cc],
        bcc: attributes.key?("bcc") ? attributes["bcc"] : attributes[:bcc],
        reply_to: attributes.key?("replyTo") ? attributes["replyTo"] : attributes[:reply_to],
        subject: attributes.key?("subject") ? attributes["subject"] : attributes[:subject],
        html: attributes.key?("html") ? attributes["html"] : attributes[:html],
        text: attributes.key?("text") ? attributes["text"] : attributes[:text],
        tags: attributes.key?("tags") ? attributes["tags"] : attributes[:tags],
        metadata: attributes.key?("metadata") ? attributes["metadata"] : attributes[:metadata],
        idempotency_key: attributes.key?("idempotencyKey") ? attributes["idempotencyKey"] : attributes[:idempotency_key],
        test_mode: attributes.key?("testMode") ? attributes["testMode"] : attributes[:test_mode],
        attachments: attributes.key?("attachments") ? attributes["attachments"] : attributes[:attachments],
        scheduled_at: attributes.key?("scheduledAt") ? attributes["scheduledAt"] : attributes[:scheduled_at],
        delivery_window: attributes.key?("deliveryWindow") ? attributes["deliveryWindow"] : attributes[:delivery_window],
        send_time_category: attributes.key?("sendTimeCategory") ? attributes["sendTimeCategory"] : attributes[:send_time_category],
        tracking_settings: attributes.key?("trackingSettings") ? attributes["trackingSettings"] : attributes[:tracking_settings],
      )
    end
  end

  # Schema type: BatchSendItemResponse
  class BatchSendItemResponse
    # @return [Integer]
    attr_accessor :index
    # @return [String, nil]
    attr_accessor :id
    # @return [String, nil]
    attr_accessor :message_id
    # @return [String, nil]
    attr_accessor :status
    # @return [String, nil]
    attr_accessor :created_at
    # @return [String, nil]
    attr_accessor :scheduled_at
    # @return [String, nil]
    attr_accessor :error

    # @param index [Integer], id [String, nil], message_id [String, nil], status [String, nil], created_at [String, nil], scheduled_at [String, nil], error [String, nil]
    def initialize(index: , id: nil, message_id: nil, status: nil, created_at: nil, scheduled_at: nil, error: nil)
      @index = index
      @id = id
      @message_id = message_id
      @status = status
      @created_at = created_at
      @scheduled_at = scheduled_at
      @error = error
    end

    # @return [Hash] a hash representation of this object
    def to_h
      {
        index: @index,
        id: @id,
        message_id: @message_id,
        status: @status,
        created_at: @created_at,
        scheduled_at: @scheduled_at,
        error: @error,
      }.compact
    end

    # Create an instance from a parsed JSON hash.
    # @param attributes [Hash]
    # @return [BatchSendItemResponse]
    def self.from_json(attributes)
      return nil unless attributes.is_a?(Hash)

      new(
        index: attributes.key?("index") ? attributes["index"] : attributes[:index],
        id: attributes.key?("id") ? attributes["id"] : attributes[:id],
        message_id: attributes.key?("messageId") ? attributes["messageId"] : attributes[:message_id],
        status: attributes.key?("status") ? attributes["status"] : attributes[:status],
        created_at: attributes.key?("createdAt") ? attributes["createdAt"] : attributes[:created_at],
        scheduled_at: attributes.key?("scheduledAt") ? attributes["scheduledAt"] : attributes[:scheduled_at],
        error: attributes.key?("error") ? attributes["error"] : attributes[:error],
      )
    end
  end

  # Schema type: SendEmailResponse
  class SendEmailResponse
    # @return [String]
    attr_accessor :id
    # @return [String, nil]
    attr_accessor :message_id
    # @return [String]
    attr_accessor :status
    # @return [String]
    attr_accessor :created_at
    # @return [String, nil]
    attr_accessor :scheduled_at
    # @return [String, nil]
    attr_accessor :audience_id
    # @return [Array<BatchSendItemResponse>]
    attr_accessor :messages

    # @param id [String], message_id [String, nil], status [String], created_at [String], scheduled_at [String, nil], audience_id [String, nil], messages [Array<BatchSendItemResponse>]
    def initialize(id: , message_id: , status: , created_at: , scheduled_at: nil, audience_id: nil, messages: nil)
      @id = id
      @message_id = message_id
      @status = status
      @created_at = created_at
      @scheduled_at = scheduled_at
      @audience_id = audience_id
      @messages = messages
    end

    # @return [Hash] a hash representation of this object
    def to_h
      {
        id: @id,
        message_id: @message_id,
        status: @status,
        created_at: @created_at,
        scheduled_at: @scheduled_at,
        audience_id: @audience_id,
        messages: @messages,
      }.compact
    end

    # Create an instance from a parsed JSON hash.
    # @param attributes [Hash]
    # @return [SendEmailResponse]
    def self.from_json(attributes)
      return nil unless attributes.is_a?(Hash)

      new(
        id: attributes.key?("id") ? attributes["id"] : attributes[:id],
        message_id: attributes.key?("messageId") ? attributes["messageId"] : attributes[:message_id],
        status: attributes.key?("status") ? attributes["status"] : attributes[:status],
        created_at: attributes.key?("createdAt") ? attributes["createdAt"] : attributes[:created_at],
        scheduled_at: attributes.key?("scheduledAt") ? attributes["scheduledAt"] : attributes[:scheduled_at],
        audience_id: attributes.key?("audienceId") ? attributes["audienceId"] : attributes[:audience_id],
        messages: attributes.key?("messages") ? attributes["messages"] : attributes[:messages],
      )
    end
  end

  # Schema type: EmailDetailResponse
  class EmailDetailResponse
    # @return [String]
    attr_accessor :id
    # @return [String, nil]
    attr_accessor :message_id
    # @return [String]
    attr_accessor :from
    # @return [Array<String>]
    attr_accessor :to
    # @return [Array<String>]
    attr_accessor :cc
    # @return [Array<String>]
    attr_accessor :bcc
    # @return [String, nil]
    attr_accessor :reply_to
    # @return [String]
    attr_accessor :subject
    # @return [String, nil]
    attr_accessor :html
    # @return [String, nil]
    attr_accessor :text
    # @return [String]
    attr_accessor :status
    # @return [String, nil]
    attr_accessor :error
    # @return [Hash{String => String}]
    attr_accessor :tags
    # @return [Hash{String => String}]
    attr_accessor :metadata
    # @return [Boolean]
    attr_accessor :test_mode
    # @return [String, nil]
    attr_accessor :topic_id
    # @return [String]
    attr_accessor :created_at
    # @return [String, nil]
    attr_accessor :sent_at
    # @return [String, nil]
    attr_accessor :updated_at

    # @param id [String], message_id [String, nil], from [String], to [Array<String>], cc [Array<String>], bcc [Array<String>], reply_to [String, nil], subject [String], html [String, nil], text [String, nil], status [String], error [String, nil], tags [Hash{String => String}], metadata [Hash{String => String}], test_mode [Boolean], topic_id [String, nil], created_at [String], sent_at [String, nil], updated_at [String, nil]
    def initialize(id: , message_id: , from: , to: , cc: , bcc: , reply_to: , subject: , html: nil, text: nil, status: , error: , tags: , metadata: , test_mode: , topic_id: nil, created_at: , sent_at: , updated_at: )
      @id = id
      @message_id = message_id
      @from = from
      @to = to
      @cc = cc
      @bcc = bcc
      @reply_to = reply_to
      @subject = subject
      @html = html
      @text = text
      @status = status
      @error = error
      @tags = tags
      @metadata = metadata
      @test_mode = test_mode
      @topic_id = topic_id
      @created_at = created_at
      @sent_at = sent_at
      @updated_at = updated_at
    end

    # @return [Hash] a hash representation of this object
    def to_h
      {
        id: @id,
        message_id: @message_id,
        from: @from,
        to: @to,
        cc: @cc,
        bcc: @bcc,
        reply_to: @reply_to,
        subject: @subject,
        html: @html,
        text: @text,
        status: @status,
        error: @error,
        tags: @tags,
        metadata: @metadata,
        test_mode: @test_mode,
        topic_id: @topic_id,
        created_at: @created_at,
        sent_at: @sent_at,
        updated_at: @updated_at,
      }.compact
    end

    # Create an instance from a parsed JSON hash.
    # @param attributes [Hash]
    # @return [EmailDetailResponse]
    def self.from_json(attributes)
      return nil unless attributes.is_a?(Hash)

      new(
        id: attributes.key?("id") ? attributes["id"] : attributes[:id],
        message_id: attributes.key?("messageId") ? attributes["messageId"] : attributes[:message_id],
        from: attributes.key?("from") ? attributes["from"] : attributes[:from],
        to: attributes.key?("to") ? attributes["to"] : attributes[:to],
        cc: attributes.key?("cc") ? attributes["cc"] : attributes[:cc],
        bcc: attributes.key?("bcc") ? attributes["bcc"] : attributes[:bcc],
        reply_to: attributes.key?("replyTo") ? attributes["replyTo"] : attributes[:reply_to],
        subject: attributes.key?("subject") ? attributes["subject"] : attributes[:subject],
        html: attributes.key?("html") ? attributes["html"] : attributes[:html],
        text: attributes.key?("text") ? attributes["text"] : attributes[:text],
        status: attributes.key?("status") ? attributes["status"] : attributes[:status],
        error: attributes.key?("error") ? attributes["error"] : attributes[:error],
        tags: attributes.key?("tags") ? attributes["tags"] : attributes[:tags],
        metadata: attributes.key?("metadata") ? attributes["metadata"] : attributes[:metadata],
        test_mode: attributes.key?("testMode") ? attributes["testMode"] : attributes[:test_mode],
        topic_id: attributes.key?("topicId") ? attributes["topicId"] : attributes[:topic_id],
        created_at: attributes.key?("createdAt") ? attributes["createdAt"] : attributes[:created_at],
        sent_at: attributes.key?("sentAt") ? attributes["sentAt"] : attributes[:sent_at],
        updated_at: attributes.key?("updatedAt") ? attributes["updatedAt"] : attributes[:updated_at],
      )
    end
  end

  # Schema type: BatchSendRequest
  class BatchSendRequest
    # @return [Array<SendEmailRequest>]
    attr_accessor :items

    # @param items [Array<SendEmailRequest>]
    def initialize(items: )
      @items = items
    end

    # @return [Hash] a hash representation of this object
    def to_h
      {
        items: @items,
      }.compact
    end

    # Create an instance from a parsed JSON hash.
    # @param attributes [Hash]
    # @return [BatchSendRequest]
    def self.from_json(attributes)
      return nil unless attributes.is_a?(Hash)

      new(
        items: attributes.key?("items") ? attributes["items"] : attributes[:items],
      )
    end
  end

  # Schema type: BatchSendResponse
  class BatchSendResponse
    # @return [Array<BatchSendItemResponse>]
    attr_accessor :results

    # @param results [Array<BatchSendItemResponse>]
    def initialize(results: )
      @results = results
    end

    # @return [Hash] a hash representation of this object
    def to_h
      {
        results: @results,
      }.compact
    end

    # Create an instance from a parsed JSON hash.
    # @param attributes [Hash]
    # @return [BatchSendResponse]
    def self.from_json(attributes)
      return nil unless attributes.is_a?(Hash)

      new(
        results: attributes.key?("results") ? attributes["results"] : attributes[:results],
      )
    end
  end

  # Schema type: CancelResponse
  class CancelResponse
    # @return [Boolean]
    attr_accessor :cancelled

    # @param cancelled [Boolean]
    def initialize(cancelled: nil)
      @cancelled = cancelled
    end

    # @return [Hash] a hash representation of this object
    def to_h
      {
        cancelled: @cancelled,
      }.compact
    end

    # Create an instance from a parsed JSON hash.
    # @param attributes [Hash]
    # @return [CancelResponse]
    def self.from_json(attributes)
      return nil unless attributes.is_a?(Hash)

      new(
        cancelled: attributes.key?("cancelled") ? attributes["cancelled"] : attributes[:cancelled],
      )
    end
  end

  # Schema type: BulkCancelResponse
  class BulkCancelResponse
    # @return [Integer]
    attr_accessor :cancelled

    # @param cancelled [Integer]
    def initialize(cancelled: )
      @cancelled = cancelled
    end

    # @return [Hash] a hash representation of this object
    def to_h
      {
        cancelled: @cancelled,
      }.compact
    end

    # Create an instance from a parsed JSON hash.
    # @param attributes [Hash]
    # @return [BulkCancelResponse]
    def self.from_json(attributes)
      return nil unless attributes.is_a?(Hash)

      new(
        cancelled: attributes.key?("cancelled") ? attributes["cancelled"] : attributes[:cancelled],
      )
    end
  end

  # Schema type: StreamTokenResponse
  class StreamTokenResponse
    # @return [String]
    attr_accessor :token
    # @return [String]
    attr_accessor :expires_at

    # @param token [String], expires_at [String]
    def initialize(token: , expires_at: )
      @token = token
      @expires_at = expires_at
    end

    # @return [Hash] a hash representation of this object
    def to_h
      {
        token: @token,
        expires_at: @expires_at,
      }.compact
    end

    # Create an instance from a parsed JSON hash.
    # @param attributes [Hash]
    # @return [StreamTokenResponse]
    def self.from_json(attributes)
      return nil unless attributes.is_a?(Hash)

      new(
        token: attributes.key?("token") ? attributes["token"] : attributes[:token],
        expires_at: attributes.key?("expiresAt") ? attributes["expiresAt"] : attributes[:expires_at],
      )
    end
  end

  # Schema type: StreamEventResponse
  class StreamEventResponse
    # @return [String]
    attr_accessor :type
    # @return [String]
    attr_accessor :email_id
    # @return [String]
    attr_accessor :occurred_at
    # @return [Hash{String => String}]
    attr_accessor :data

    # @param type [String], email_id [String], occurred_at [String], data [Hash{String => String}]
    def initialize(type: , email_id: , occurred_at: , data: nil)
      @type = type
      @email_id = email_id
      @occurred_at = occurred_at
      @data = data
    end

    # @return [Hash] a hash representation of this object
    def to_h
      {
        type: @type,
        email_id: @email_id,
        occurred_at: @occurred_at,
        data: @data,
      }.compact
    end

    # Create an instance from a parsed JSON hash.
    # @param attributes [Hash]
    # @return [StreamEventResponse]
    def self.from_json(attributes)
      return nil unless attributes.is_a?(Hash)

      new(
        type: attributes.key?("type") ? attributes["type"] : attributes[:type],
        email_id: attributes.key?("emailId") ? attributes["emailId"] : attributes[:email_id],
        occurred_at: attributes.key?("occurredAt") ? attributes["occurredAt"] : attributes[:occurred_at],
        data: attributes.key?("data") ? attributes["data"] : attributes[:data],
      )
    end
  end

  # Schema type: ValidateLinksRequest
  class ValidateLinksRequest
    # @return [String, nil]
    attr_accessor :html

    # @param html [String, nil]
    def initialize(html: nil)
      @html = html
    end

    # @return [Hash] a hash representation of this object
    def to_h
      {
        html: @html,
      }.compact
    end

    # Create an instance from a parsed JSON hash.
    # @param attributes [Hash]
    # @return [ValidateLinksRequest]
    def self.from_json(attributes)
      return nil unless attributes.is_a?(Hash)

      new(
        html: attributes.key?("html") ? attributes["html"] : attributes[:html],
      )
    end
  end

  # Schema type: LinkResultItem
  class LinkResultItem
    # @return [String]
    attr_accessor :url
    # @return [String]
    attr_accessor :status
    # @return [Integer, nil]
    attr_accessor :status_code
    # @return [String, nil]
    attr_accessor :error

    # @param url [String], status [String], status_code [Integer, nil], error [String, nil]
    def initialize(url: , status: , status_code: nil, error: nil)
      @url = url
      @status = status
      @status_code = status_code
      @error = error
    end

    # @return [Hash] a hash representation of this object
    def to_h
      {
        url: @url,
        status: @status,
        status_code: @status_code,
        error: @error,
      }.compact
    end

    # Create an instance from a parsed JSON hash.
    # @param attributes [Hash]
    # @return [LinkResultItem]
    def self.from_json(attributes)
      return nil unless attributes.is_a?(Hash)

      new(
        url: attributes.key?("url") ? attributes["url"] : attributes[:url],
        status: attributes.key?("status") ? attributes["status"] : attributes[:status],
        status_code: attributes.key?("statusCode") ? attributes["statusCode"] : attributes[:status_code],
        error: attributes.key?("error") ? attributes["error"] : attributes[:error],
      )
    end
  end

  # Schema type: ValidateLinksResponse
  class ValidateLinksResponse
    # @return [Array<LinkResultItem>]
    attr_accessor :links
    # @return [Integer]
    attr_accessor :total_links
    # @return [Integer]
    attr_accessor :broken_links
    # @return [Integer]
    attr_accessor :error_links

    # @param links [Array<LinkResultItem>], total_links [Integer], broken_links [Integer], error_links [Integer]
    def initialize(links: , total_links: , broken_links: , error_links: )
      @links = links
      @total_links = total_links
      @broken_links = broken_links
      @error_links = error_links
    end

    # @return [Hash] a hash representation of this object
    def to_h
      {
        links: @links,
        total_links: @total_links,
        broken_links: @broken_links,
        error_links: @error_links,
      }.compact
    end

    # Create an instance from a parsed JSON hash.
    # @param attributes [Hash]
    # @return [ValidateLinksResponse]
    def self.from_json(attributes)
      return nil unless attributes.is_a?(Hash)

      new(
        links: attributes.key?("links") ? attributes["links"] : attributes[:links],
        total_links: attributes.key?("totalLinks") ? attributes["totalLinks"] : attributes[:total_links],
        broken_links: attributes.key?("brokenLinks") ? attributes["brokenLinks"] : attributes[:broken_links],
        error_links: attributes.key?("errorLinks") ? attributes["errorLinks"] : attributes[:error_links],
      )
    end
  end

  # Schema type: MetricsWindowResponse
  class MetricsWindowResponse
    # @return [String]
    attr_accessor :from
    # @return [String]
    attr_accessor :to
    # @return [String]
    attr_accessor :label

    # @param from [String], to [String], label [String]
    def initialize(from: , to: , label: )
      @from = from
      @to = to
      @label = label
    end

    # @return [Hash] a hash representation of this object
    def to_h
      {
        from: @from,
        to: @to,
        label: @label,
      }.compact
    end

    # Create an instance from a parsed JSON hash.
    # @param attributes [Hash]
    # @return [MetricsWindowResponse]
    def self.from_json(attributes)
      return nil unless attributes.is_a?(Hash)

      new(
        from: attributes.key?("from") ? attributes["from"] : attributes[:from],
        to: attributes.key?("to") ? attributes["to"] : attributes[:to],
        label: attributes.key?("label") ? attributes["label"] : attributes[:label],
      )
    end
  end

  # Schema type: TopicPerformanceResponse
  class TopicPerformanceResponse
    # @return [String]
    attr_accessor :topic_id
    # @return [String]
    attr_accessor :topic_name
    # @return [MetricsWindowResponse]
    attr_accessor :window
    # @return [Integer]
    attr_accessor :total_emails
    # @return [Integer]
    attr_accessor :delivered
    # @return [Float]
    attr_accessor :delivery_rate
    # @return [Integer]
    attr_accessor :opened
    # @return [Float]
    attr_accessor :open_rate
    # @return [Integer]
    attr_accessor :clicked
    # @return [Float]
    attr_accessor :click_rate
    # @return [Integer]
    attr_accessor :bounced
    # @return [Float]
    attr_accessor :bounce_rate
    # @return [Integer]
    attr_accessor :complained
    # @return [Float]
    attr_accessor :complaint_rate
    # @return [Integer]
    attr_accessor :unsubscribed
    # @return [Float]
    attr_accessor :unsubscribe_rate
    # @return [Integer]
    attr_accessor :read_engaged
    # @return [Float]
    attr_accessor :read_engagement_rate
    # @return [Float, nil]
    attr_accessor :avg_read_time_seconds
    # @return [Integer]
    attr_accessor :opt_in_count
    # @return [Integer]
    attr_accessor :opt_out_count
    # @return [String]
    attr_accessor :computed_at

    # @param topic_id [String], topic_name [String], window [MetricsWindowResponse], total_emails [Integer], delivered [Integer], delivery_rate [Float], opened [Integer], open_rate [Float], clicked [Integer], click_rate [Float], bounced [Integer], bounce_rate [Float], complained [Integer], complaint_rate [Float], unsubscribed [Integer], unsubscribe_rate [Float], read_engaged [Integer], read_engagement_rate [Float], avg_read_time_seconds [Float, nil], opt_in_count [Integer], opt_out_count [Integer], computed_at [String]
    def initialize(topic_id: , topic_name: , window: , total_emails: , delivered: , delivery_rate: , opened: , open_rate: , clicked: , click_rate: , bounced: , bounce_rate: , complained: , complaint_rate: , unsubscribed: , unsubscribe_rate: , read_engaged: , read_engagement_rate: , avg_read_time_seconds: , opt_in_count: , opt_out_count: , computed_at: )
      @topic_id = topic_id
      @topic_name = topic_name
      @window = window
      @total_emails = total_emails
      @delivered = delivered
      @delivery_rate = delivery_rate
      @opened = opened
      @open_rate = open_rate
      @clicked = clicked
      @click_rate = click_rate
      @bounced = bounced
      @bounce_rate = bounce_rate
      @complained = complained
      @complaint_rate = complaint_rate
      @unsubscribed = unsubscribed
      @unsubscribe_rate = unsubscribe_rate
      @read_engaged = read_engaged
      @read_engagement_rate = read_engagement_rate
      @avg_read_time_seconds = avg_read_time_seconds
      @opt_in_count = opt_in_count
      @opt_out_count = opt_out_count
      @computed_at = computed_at
    end

    # @return [Hash] a hash representation of this object
    def to_h
      {
        topic_id: @topic_id,
        topic_name: @topic_name,
        window: @window,
        total_emails: @total_emails,
        delivered: @delivered,
        delivery_rate: @delivery_rate,
        opened: @opened,
        open_rate: @open_rate,
        clicked: @clicked,
        click_rate: @click_rate,
        bounced: @bounced,
        bounce_rate: @bounce_rate,
        complained: @complained,
        complaint_rate: @complaint_rate,
        unsubscribed: @unsubscribed,
        unsubscribe_rate: @unsubscribe_rate,
        read_engaged: @read_engaged,
        read_engagement_rate: @read_engagement_rate,
        avg_read_time_seconds: @avg_read_time_seconds,
        opt_in_count: @opt_in_count,
        opt_out_count: @opt_out_count,
        computed_at: @computed_at,
      }.compact
    end

    # Create an instance from a parsed JSON hash.
    # @param attributes [Hash]
    # @return [TopicPerformanceResponse]
    def self.from_json(attributes)
      return nil unless attributes.is_a?(Hash)

      new(
        topic_id: attributes.key?("topicId") ? attributes["topicId"] : attributes[:topic_id],
        topic_name: attributes.key?("topicName") ? attributes["topicName"] : attributes[:topic_name],
        window: attributes.key?("window") ? attributes["window"] : attributes[:window],
        total_emails: attributes.key?("totalEmails") ? attributes["totalEmails"] : attributes[:total_emails],
        delivered: attributes.key?("delivered") ? attributes["delivered"] : attributes[:delivered],
        delivery_rate: attributes.key?("deliveryRate") ? attributes["deliveryRate"] : attributes[:delivery_rate],
        opened: attributes.key?("opened") ? attributes["opened"] : attributes[:opened],
        open_rate: attributes.key?("openRate") ? attributes["openRate"] : attributes[:open_rate],
        clicked: attributes.key?("clicked") ? attributes["clicked"] : attributes[:clicked],
        click_rate: attributes.key?("clickRate") ? attributes["clickRate"] : attributes[:click_rate],
        bounced: attributes.key?("bounced") ? attributes["bounced"] : attributes[:bounced],
        bounce_rate: attributes.key?("bounceRate") ? attributes["bounceRate"] : attributes[:bounce_rate],
        complained: attributes.key?("complained") ? attributes["complained"] : attributes[:complained],
        complaint_rate: attributes.key?("complaintRate") ? attributes["complaintRate"] : attributes[:complaint_rate],
        unsubscribed: attributes.key?("unsubscribed") ? attributes["unsubscribed"] : attributes[:unsubscribed],
        unsubscribe_rate: attributes.key?("unsubscribeRate") ? attributes["unsubscribeRate"] : attributes[:unsubscribe_rate],
        read_engaged: attributes.key?("readEngaged") ? attributes["readEngaged"] : attributes[:read_engaged],
        read_engagement_rate: attributes.key?("readEngagementRate") ? attributes["readEngagementRate"] : attributes[:read_engagement_rate],
        avg_read_time_seconds: attributes.key?("avgReadTimeSeconds") ? attributes["avgReadTimeSeconds"] : attributes[:avg_read_time_seconds],
        opt_in_count: attributes.key?("optInCount") ? attributes["optInCount"] : attributes[:opt_in_count],
        opt_out_count: attributes.key?("optOutCount") ? attributes["optOutCount"] : attributes[:opt_out_count],
        computed_at: attributes.key?("computedAt") ? attributes["computedAt"] : attributes[:computed_at],
      )
    end
  end

  # Schema type: EmailPerformanceResponse
  class EmailPerformanceResponse
    # @return [String]
    attr_accessor :email_id
    # @return [String]
    attr_accessor :subject
    # @return [String]
    attr_accessor :from_address
    # @return [String, nil]
    attr_accessor :topic_id
    # @return [String]
    attr_accessor :status
    # @return [Boolean]
    attr_accessor :delivered
    # @return [Boolean]
    attr_accessor :opened
    # @return [Boolean]
    attr_accessor :clicked
    # @return [Integer]
    attr_accessor :total_clicks
    # @return [Boolean]
    attr_accessor :bounced
    # @return [Boolean]
    attr_accessor :complained
    # @return [Boolean]
    attr_accessor :unsubscribed
    # @return [Boolean]
    attr_accessor :read_engaged
    # @return [Float, nil]
    attr_accessor :read_time_seconds
    # @return [String, nil]
    attr_accessor :read_category
    # @return [String, nil]
    attr_accessor :sent_at
    # @return [String, nil]
    attr_accessor :last_event_at
    # @return [String]
    attr_accessor :computed_at

    # @param email_id [String], subject [String], from_address [String], topic_id [String, nil], status [String], delivered [Boolean], opened [Boolean], clicked [Boolean], total_clicks [Integer], bounced [Boolean], complained [Boolean], unsubscribed [Boolean], read_engaged [Boolean], read_time_seconds [Float, nil], read_category [String, nil], sent_at [String, nil], last_event_at [String, nil], computed_at [String]
    def initialize(email_id: , subject: , from_address: , topic_id: , status: , delivered: , opened: , clicked: , total_clicks: , bounced: , complained: , unsubscribed: , read_engaged: , read_time_seconds: , read_category: , sent_at: , last_event_at: , computed_at: )
      @email_id = email_id
      @subject = subject
      @from_address = from_address
      @topic_id = topic_id
      @status = status
      @delivered = delivered
      @opened = opened
      @clicked = clicked
      @total_clicks = total_clicks
      @bounced = bounced
      @complained = complained
      @unsubscribed = unsubscribed
      @read_engaged = read_engaged
      @read_time_seconds = read_time_seconds
      @read_category = read_category
      @sent_at = sent_at
      @last_event_at = last_event_at
      @computed_at = computed_at
    end

    # @return [Hash] a hash representation of this object
    def to_h
      {
        email_id: @email_id,
        subject: @subject,
        from_address: @from_address,
        topic_id: @topic_id,
        status: @status,
        delivered: @delivered,
        opened: @opened,
        clicked: @clicked,
        total_clicks: @total_clicks,
        bounced: @bounced,
        complained: @complained,
        unsubscribed: @unsubscribed,
        read_engaged: @read_engaged,
        read_time_seconds: @read_time_seconds,
        read_category: @read_category,
        sent_at: @sent_at,
        last_event_at: @last_event_at,
        computed_at: @computed_at,
      }.compact
    end

    # Create an instance from a parsed JSON hash.
    # @param attributes [Hash]
    # @return [EmailPerformanceResponse]
    def self.from_json(attributes)
      return nil unless attributes.is_a?(Hash)

      new(
        email_id: attributes.key?("emailId") ? attributes["emailId"] : attributes[:email_id],
        subject: attributes.key?("subject") ? attributes["subject"] : attributes[:subject],
        from_address: attributes.key?("fromAddress") ? attributes["fromAddress"] : attributes[:from_address],
        topic_id: attributes.key?("topicId") ? attributes["topicId"] : attributes[:topic_id],
        status: attributes.key?("status") ? attributes["status"] : attributes[:status],
        delivered: attributes.key?("delivered") ? attributes["delivered"] : attributes[:delivered],
        opened: attributes.key?("opened") ? attributes["opened"] : attributes[:opened],
        clicked: attributes.key?("clicked") ? attributes["clicked"] : attributes[:clicked],
        total_clicks: attributes.key?("totalClicks") ? attributes["totalClicks"] : attributes[:total_clicks],
        bounced: attributes.key?("bounced") ? attributes["bounced"] : attributes[:bounced],
        complained: attributes.key?("complained") ? attributes["complained"] : attributes[:complained],
        unsubscribed: attributes.key?("unsubscribed") ? attributes["unsubscribed"] : attributes[:unsubscribed],
        read_engaged: attributes.key?("readEngaged") ? attributes["readEngaged"] : attributes[:read_engaged],
        read_time_seconds: attributes.key?("readTimeSeconds") ? attributes["readTimeSeconds"] : attributes[:read_time_seconds],
        read_category: attributes.key?("readCategory") ? attributes["readCategory"] : attributes[:read_category],
        sent_at: attributes.key?("sentAt") ? attributes["sentAt"] : attributes[:sent_at],
        last_event_at: attributes.key?("lastEventAt") ? attributes["lastEventAt"] : attributes[:last_event_at],
        computed_at: attributes.key?("computedAt") ? attributes["computedAt"] : attributes[:computed_at],
      )
    end
  end

  # Schema type: EmailReadScrollAnalyticsResponse
  class EmailReadScrollAnalyticsResponse
    # @return [String]
    attr_accessor :email_id
    # @return [String]
    attr_accessor :subject
    # @return [String]
    attr_accessor :computed_at
    # @return [Boolean]
    attr_accessor :read_engaged
    # @return [Float, nil]
    attr_accessor :read_time_seconds
    # @return [String, nil]
    attr_accessor :read_category
    # @return [String, nil]
    attr_accessor :mail_client
    # @return [String, nil]
    attr_accessor :device_type
    # @return [String, nil]
    attr_accessor :os
    # @return [String, nil]
    attr_accessor :read_engaged_at
    # @return [Boolean]
    attr_accessor :short_email
    # @return [Integer]
    attr_accessor :depth25_count
    # @return [Integer]
    attr_accessor :depth50_count
    # @return [Integer]
    attr_accessor :depth75_count
    # @return [Integer]
    attr_accessor :depth100_count
    # @return [Integer, nil]
    attr_accessor :max_depth_pct
    # @return [Float, nil]
    attr_accessor :depth25_rate
    # @return [Float, nil]
    attr_accessor :depth50_rate
    # @return [Float, nil]
    attr_accessor :depth75_rate
    # @return [Float, nil]
    attr_accessor :depth100_rate

    # @param email_id [String], subject [String], computed_at [String], read_engaged [Boolean], read_time_seconds [Float, nil], read_category [String, nil], mail_client [String, nil], device_type [String, nil], os [String, nil], read_engaged_at [String, nil], short_email [Boolean], depth25_count [Integer], depth50_count [Integer], depth75_count [Integer], depth100_count [Integer], max_depth_pct [Integer, nil], depth25_rate [Float, nil], depth50_rate [Float, nil], depth75_rate [Float, nil], depth100_rate [Float, nil]
    def initialize(email_id: , subject: , computed_at: , read_engaged: , read_time_seconds: , read_category: , mail_client: , device_type: , os: , read_engaged_at: , short_email: , depth25_count: , depth50_count: , depth75_count: , depth100_count: , max_depth_pct: , depth25_rate: , depth50_rate: , depth75_rate: , depth100_rate: )
      @email_id = email_id
      @subject = subject
      @computed_at = computed_at
      @read_engaged = read_engaged
      @read_time_seconds = read_time_seconds
      @read_category = read_category
      @mail_client = mail_client
      @device_type = device_type
      @os = os
      @read_engaged_at = read_engaged_at
      @short_email = short_email
      @depth25_count = depth25_count
      @depth50_count = depth50_count
      @depth75_count = depth75_count
      @depth100_count = depth100_count
      @max_depth_pct = max_depth_pct
      @depth25_rate = depth25_rate
      @depth50_rate = depth50_rate
      @depth75_rate = depth75_rate
      @depth100_rate = depth100_rate
    end

    # @return [Hash] a hash representation of this object
    def to_h
      {
        email_id: @email_id,
        subject: @subject,
        computed_at: @computed_at,
        read_engaged: @read_engaged,
        read_time_seconds: @read_time_seconds,
        read_category: @read_category,
        mail_client: @mail_client,
        device_type: @device_type,
        os: @os,
        read_engaged_at: @read_engaged_at,
        short_email: @short_email,
        depth25_count: @depth25_count,
        depth50_count: @depth50_count,
        depth75_count: @depth75_count,
        depth100_count: @depth100_count,
        max_depth_pct: @max_depth_pct,
        depth25_rate: @depth25_rate,
        depth50_rate: @depth50_rate,
        depth75_rate: @depth75_rate,
        depth100_rate: @depth100_rate,
      }.compact
    end

    # Create an instance from a parsed JSON hash.
    # @param attributes [Hash]
    # @return [EmailReadScrollAnalyticsResponse]
    def self.from_json(attributes)
      return nil unless attributes.is_a?(Hash)

      new(
        email_id: attributes.key?("emailId") ? attributes["emailId"] : attributes[:email_id],
        subject: attributes.key?("subject") ? attributes["subject"] : attributes[:subject],
        computed_at: attributes.key?("computedAt") ? attributes["computedAt"] : attributes[:computed_at],
        read_engaged: attributes.key?("readEngaged") ? attributes["readEngaged"] : attributes[:read_engaged],
        read_time_seconds: attributes.key?("readTimeSeconds") ? attributes["readTimeSeconds"] : attributes[:read_time_seconds],
        read_category: attributes.key?("readCategory") ? attributes["readCategory"] : attributes[:read_category],
        mail_client: attributes.key?("mailClient") ? attributes["mailClient"] : attributes[:mail_client],
        device_type: attributes.key?("deviceType") ? attributes["deviceType"] : attributes[:device_type],
        os: attributes.key?("os") ? attributes["os"] : attributes[:os],
        read_engaged_at: attributes.key?("readEngagedAt") ? attributes["readEngagedAt"] : attributes[:read_engaged_at],
        short_email: attributes.key?("shortEmail") ? attributes["shortEmail"] : attributes[:short_email],
        depth25_count: attributes.key?("depth25Count") ? attributes["depth25Count"] : attributes[:depth25_count],
        depth50_count: attributes.key?("depth50Count") ? attributes["depth50Count"] : attributes[:depth50_count],
        depth75_count: attributes.key?("depth75Count") ? attributes["depth75Count"] : attributes[:depth75_count],
        depth100_count: attributes.key?("depth100Count") ? attributes["depth100Count"] : attributes[:depth100_count],
        max_depth_pct: attributes.key?("maxDepthPct") ? attributes["maxDepthPct"] : attributes[:max_depth_pct],
        depth25_rate: attributes.key?("depth25Rate") ? attributes["depth25Rate"] : attributes[:depth25_rate],
        depth50_rate: attributes.key?("depth50Rate") ? attributes["depth50Rate"] : attributes[:depth50_rate],
        depth75_rate: attributes.key?("depth75Rate") ? attributes["depth75Rate"] : attributes[:depth75_rate],
        depth100_rate: attributes.key?("depth100Rate") ? attributes["depth100Rate"] : attributes[:depth100_rate],
      )
    end
  end

  # Schema type: ProjectMetricsSummaryResponse
  class ProjectMetricsSummaryResponse
    # @return [String]
    attr_accessor :project_id
    # @return [MetricsWindowResponse]
    attr_accessor :window
    # @return [Integer]
    attr_accessor :sent
    # @return [Integer]
    attr_accessor :delivered
    # @return [Integer]
    attr_accessor :opened
    # @return [Integer]
    attr_accessor :clicked
    # @return [Integer]
    attr_accessor :bounced
    # @return [Integer]
    attr_accessor :complained
    # @return [Integer]
    attr_accessor :failed
    # @return [Integer]
    attr_accessor :unsubscribed
    # @return [Integer]
    attr_accessor :read_engaged
    # @return [Float]
    attr_accessor :delivery_rate
    # @return [Float]
    attr_accessor :open_rate
    # @return [Float]
    attr_accessor :click_rate
    # @return [Float]
    attr_accessor :bounce_rate
    # @return [Float]
    attr_accessor :complaint_rate
    # @return [Float]
    attr_accessor :read_engagement_rate

    # @param project_id [String], window [MetricsWindowResponse], sent [Integer], delivered [Integer], opened [Integer], clicked [Integer], bounced [Integer], complained [Integer], failed [Integer], unsubscribed [Integer], read_engaged [Integer], delivery_rate [Float], open_rate [Float], click_rate [Float], bounce_rate [Float], complaint_rate [Float], read_engagement_rate [Float]
    def initialize(project_id: , window: , sent: , delivered: , opened: , clicked: , bounced: , complained: , failed: , unsubscribed: , read_engaged: , delivery_rate: , open_rate: , click_rate: , bounce_rate: , complaint_rate: , read_engagement_rate: )
      @project_id = project_id
      @window = window
      @sent = sent
      @delivered = delivered
      @opened = opened
      @clicked = clicked
      @bounced = bounced
      @complained = complained
      @failed = failed
      @unsubscribed = unsubscribed
      @read_engaged = read_engaged
      @delivery_rate = delivery_rate
      @open_rate = open_rate
      @click_rate = click_rate
      @bounce_rate = bounce_rate
      @complaint_rate = complaint_rate
      @read_engagement_rate = read_engagement_rate
    end

    # @return [Hash] a hash representation of this object
    def to_h
      {
        project_id: @project_id,
        window: @window,
        sent: @sent,
        delivered: @delivered,
        opened: @opened,
        clicked: @clicked,
        bounced: @bounced,
        complained: @complained,
        failed: @failed,
        unsubscribed: @unsubscribed,
        read_engaged: @read_engaged,
        delivery_rate: @delivery_rate,
        open_rate: @open_rate,
        click_rate: @click_rate,
        bounce_rate: @bounce_rate,
        complaint_rate: @complaint_rate,
        read_engagement_rate: @read_engagement_rate,
      }.compact
    end

    # Create an instance from a parsed JSON hash.
    # @param attributes [Hash]
    # @return [ProjectMetricsSummaryResponse]
    def self.from_json(attributes)
      return nil unless attributes.is_a?(Hash)

      new(
        project_id: attributes.key?("projectId") ? attributes["projectId"] : attributes[:project_id],
        window: attributes.key?("window") ? attributes["window"] : attributes[:window],
        sent: attributes.key?("sent") ? attributes["sent"] : attributes[:sent],
        delivered: attributes.key?("delivered") ? attributes["delivered"] : attributes[:delivered],
        opened: attributes.key?("opened") ? attributes["opened"] : attributes[:opened],
        clicked: attributes.key?("clicked") ? attributes["clicked"] : attributes[:clicked],
        bounced: attributes.key?("bounced") ? attributes["bounced"] : attributes[:bounced],
        complained: attributes.key?("complained") ? attributes["complained"] : attributes[:complained],
        failed: attributes.key?("failed") ? attributes["failed"] : attributes[:failed],
        unsubscribed: attributes.key?("unsubscribed") ? attributes["unsubscribed"] : attributes[:unsubscribed],
        read_engaged: attributes.key?("readEngaged") ? attributes["readEngaged"] : attributes[:read_engaged],
        delivery_rate: attributes.key?("deliveryRate") ? attributes["deliveryRate"] : attributes[:delivery_rate],
        open_rate: attributes.key?("openRate") ? attributes["openRate"] : attributes[:open_rate],
        click_rate: attributes.key?("clickRate") ? attributes["clickRate"] : attributes[:click_rate],
        bounce_rate: attributes.key?("bounceRate") ? attributes["bounceRate"] : attributes[:bounce_rate],
        complaint_rate: attributes.key?("complaintRate") ? attributes["complaintRate"] : attributes[:complaint_rate],
        read_engagement_rate: attributes.key?("readEngagementRate") ? attributes["readEngagementRate"] : attributes[:read_engagement_rate],
      )
    end
  end

  # Schema type: ProjectTimelineBucketResponse
  class ProjectTimelineBucketResponse
    # @return [String]
    attr_accessor :bucket
    # @return [String]
    attr_accessor :type
    # @return [Integer]
    attr_accessor :count

    # @param bucket [String], type [String], count [Integer]
    def initialize(bucket: , type: , count: )
      @bucket = bucket
      @type = type
      @count = count
    end

    # @return [Hash] a hash representation of this object
    def to_h
      {
        bucket: @bucket,
        type: @type,
        count: @count,
      }.compact
    end

    # Create an instance from a parsed JSON hash.
    # @param attributes [Hash]
    # @return [ProjectTimelineBucketResponse]
    def self.from_json(attributes)
      return nil unless attributes.is_a?(Hash)

      new(
        bucket: attributes.key?("bucket") ? attributes["bucket"] : attributes[:bucket],
        type: attributes.key?("type") ? attributes["type"] : attributes[:type],
        count: attributes.key?("count") ? attributes["count"] : attributes[:count],
      )
    end
  end

  # Schema type: ProjectMetricsTimelineResponse
  class ProjectMetricsTimelineResponse
    # @return [String]
    attr_accessor :project_id
    # @return [MetricsWindowResponse]
    attr_accessor :window
    # @return [String]
    attr_accessor :granularity
    # @return [String]
    attr_accessor :format
    # @return [Array<ProjectTimelineBucketResponse>]
    attr_accessor :buckets

    # @param project_id [String], window [MetricsWindowResponse], granularity [String], format [String], buckets [Array<ProjectTimelineBucketResponse>]
    def initialize(project_id: , window: , granularity: , format: , buckets: )
      @project_id = project_id
      @window = window
      @granularity = granularity
      @format = format
      @buckets = buckets
    end

    # @return [Hash] a hash representation of this object
    def to_h
      {
        project_id: @project_id,
        window: @window,
        granularity: @granularity,
        format: @format,
        buckets: @buckets,
      }.compact
    end

    # Create an instance from a parsed JSON hash.
    # @param attributes [Hash]
    # @return [ProjectMetricsTimelineResponse]
    def self.from_json(attributes)
      return nil unless attributes.is_a?(Hash)

      new(
        project_id: attributes.key?("projectId") ? attributes["projectId"] : attributes[:project_id],
        window: attributes.key?("window") ? attributes["window"] : attributes[:window],
        granularity: attributes.key?("granularity") ? attributes["granularity"] : attributes[:granularity],
        format: attributes.key?("format") ? attributes["format"] : attributes[:format],
        buckets: attributes.key?("buckets") ? attributes["buckets"] : attributes[:buckets],
      )
    end
  end

  # Schema type: AdvisorRecommendationDataResponse
  class AdvisorRecommendationDataResponse
    # @return [Float, nil]
    attr_accessor :bounce_rate
    # @return [Integer, nil]
    attr_accessor :bounced
    # @return [Integer, nil]
    attr_accessor :accepted
    # @return [Float, nil]
    attr_accessor :complaint_rate
    # @return [Integer, nil]
    attr_accessor :accepted24h
    # @return [Integer, nil]
    attr_accessor :avg_daily_accepted7d
    # @return [Integer, nil]
    attr_accessor :days_since_last_send
    # @return [Float, nil]
    attr_accessor :reported_open_rate
    # @return [Float, nil]
    attr_accessor :adjusted_open_rate
    # @return [Float, nil]
    attr_accessor :proxy_rate
    # @return [Integer, nil]
    attr_accessor :proxy_opens
    # @return [Integer, nil]
    attr_accessor :total_opens
    # @return [Float, nil]
    attr_accessor :human_open_rate
    # @return [Integer, nil]
    attr_accessor :delivered
    # @return [Float, nil]
    attr_accessor :unsub_rate
    # @return [Integer, nil]
    attr_accessor :unsubscribed
    # @return [Float, nil]
    attr_accessor :dmarc_alignment_failure_rate7d
    # @return [String, nil]
    attr_accessor :dmarc_domain
    # @return [String, nil]
    attr_accessor :dmarc_current_policy
    # @return [String, nil]
    attr_accessor :dmarc_recommended_policy
    # @return [Integer, nil]
    attr_accessor :dmarc_observed_messages
    # @return [Integer, nil]
    attr_accessor :dmarc_aligned_messages
    # @return [Float, nil]
    attr_accessor :dmarc_accounted_rate
    # @return [Integer, nil]
    attr_accessor :dmarc_unknown_messages
    # @return [Integer, nil]
    attr_accessor :dmarc_unknown_sources
    # @return [Integer, nil]
    attr_accessor :dmarc_reporting_days

    # @param bounce_rate [Float, nil], bounced [Integer, nil], accepted [Integer, nil], complaint_rate [Float, nil], accepted24h [Integer, nil], avg_daily_accepted7d [Integer, nil], days_since_last_send [Integer, nil], reported_open_rate [Float, nil], adjusted_open_rate [Float, nil], proxy_rate [Float, nil], proxy_opens [Integer, nil], total_opens [Integer, nil], human_open_rate [Float, nil], delivered [Integer, nil], unsub_rate [Float, nil], unsubscribed [Integer, nil], dmarc_alignment_failure_rate7d [Float, nil], dmarc_domain [String, nil], dmarc_current_policy [String, nil], dmarc_recommended_policy [String, nil], dmarc_observed_messages [Integer, nil], dmarc_aligned_messages [Integer, nil], dmarc_accounted_rate [Float, nil], dmarc_unknown_messages [Integer, nil], dmarc_unknown_sources [Integer, nil], dmarc_reporting_days [Integer, nil]
    def initialize(bounce_rate: nil, bounced: nil, accepted: nil, complaint_rate: nil, accepted24h: nil, avg_daily_accepted7d: nil, days_since_last_send: nil, reported_open_rate: nil, adjusted_open_rate: nil, proxy_rate: nil, proxy_opens: nil, total_opens: nil, human_open_rate: nil, delivered: nil, unsub_rate: nil, unsubscribed: nil, dmarc_alignment_failure_rate7d: nil, dmarc_domain: nil, dmarc_current_policy: nil, dmarc_recommended_policy: nil, dmarc_observed_messages: nil, dmarc_aligned_messages: nil, dmarc_accounted_rate: nil, dmarc_unknown_messages: nil, dmarc_unknown_sources: nil, dmarc_reporting_days: nil)
      @bounce_rate = bounce_rate
      @bounced = bounced
      @accepted = accepted
      @complaint_rate = complaint_rate
      @accepted24h = accepted24h
      @avg_daily_accepted7d = avg_daily_accepted7d
      @days_since_last_send = days_since_last_send
      @reported_open_rate = reported_open_rate
      @adjusted_open_rate = adjusted_open_rate
      @proxy_rate = proxy_rate
      @proxy_opens = proxy_opens
      @total_opens = total_opens
      @human_open_rate = human_open_rate
      @delivered = delivered
      @unsub_rate = unsub_rate
      @unsubscribed = unsubscribed
      @dmarc_alignment_failure_rate7d = dmarc_alignment_failure_rate7d
      @dmarc_domain = dmarc_domain
      @dmarc_current_policy = dmarc_current_policy
      @dmarc_recommended_policy = dmarc_recommended_policy
      @dmarc_observed_messages = dmarc_observed_messages
      @dmarc_aligned_messages = dmarc_aligned_messages
      @dmarc_accounted_rate = dmarc_accounted_rate
      @dmarc_unknown_messages = dmarc_unknown_messages
      @dmarc_unknown_sources = dmarc_unknown_sources
      @dmarc_reporting_days = dmarc_reporting_days
    end

    # @return [Hash] a hash representation of this object
    def to_h
      {
        bounce_rate: @bounce_rate,
        bounced: @bounced,
        accepted: @accepted,
        complaint_rate: @complaint_rate,
        accepted24h: @accepted24h,
        avg_daily_accepted7d: @avg_daily_accepted7d,
        days_since_last_send: @days_since_last_send,
        reported_open_rate: @reported_open_rate,
        adjusted_open_rate: @adjusted_open_rate,
        proxy_rate: @proxy_rate,
        proxy_opens: @proxy_opens,
        total_opens: @total_opens,
        human_open_rate: @human_open_rate,
        delivered: @delivered,
        unsub_rate: @unsub_rate,
        unsubscribed: @unsubscribed,
        dmarc_alignment_failure_rate7d: @dmarc_alignment_failure_rate7d,
        dmarc_domain: @dmarc_domain,
        dmarc_current_policy: @dmarc_current_policy,
        dmarc_recommended_policy: @dmarc_recommended_policy,
        dmarc_observed_messages: @dmarc_observed_messages,
        dmarc_aligned_messages: @dmarc_aligned_messages,
        dmarc_accounted_rate: @dmarc_accounted_rate,
        dmarc_unknown_messages: @dmarc_unknown_messages,
        dmarc_unknown_sources: @dmarc_unknown_sources,
        dmarc_reporting_days: @dmarc_reporting_days,
      }.compact
    end

    # Create an instance from a parsed JSON hash.
    # @param attributes [Hash]
    # @return [AdvisorRecommendationDataResponse]
    def self.from_json(attributes)
      return nil unless attributes.is_a?(Hash)

      new(
        bounce_rate: attributes.key?("bounceRate") ? attributes["bounceRate"] : attributes[:bounce_rate],
        bounced: attributes.key?("bounced") ? attributes["bounced"] : attributes[:bounced],
        accepted: attributes.key?("accepted") ? attributes["accepted"] : attributes[:accepted],
        complaint_rate: attributes.key?("complaintRate") ? attributes["complaintRate"] : attributes[:complaint_rate],
        accepted24h: attributes.key?("accepted24h") ? attributes["accepted24h"] : attributes[:accepted24h],
        avg_daily_accepted7d: attributes.key?("avgDailyAccepted7d") ? attributes["avgDailyAccepted7d"] : attributes[:avg_daily_accepted7d],
        days_since_last_send: attributes.key?("daysSinceLastSend") ? attributes["daysSinceLastSend"] : attributes[:days_since_last_send],
        reported_open_rate: attributes.key?("reportedOpenRate") ? attributes["reportedOpenRate"] : attributes[:reported_open_rate],
        adjusted_open_rate: attributes.key?("adjustedOpenRate") ? attributes["adjustedOpenRate"] : attributes[:adjusted_open_rate],
        proxy_rate: attributes.key?("proxyRate") ? attributes["proxyRate"] : attributes[:proxy_rate],
        proxy_opens: attributes.key?("proxyOpens") ? attributes["proxyOpens"] : attributes[:proxy_opens],
        total_opens: attributes.key?("totalOpens") ? attributes["totalOpens"] : attributes[:total_opens],
        human_open_rate: attributes.key?("humanOpenRate") ? attributes["humanOpenRate"] : attributes[:human_open_rate],
        delivered: attributes.key?("delivered") ? attributes["delivered"] : attributes[:delivered],
        unsub_rate: attributes.key?("unsubRate") ? attributes["unsubRate"] : attributes[:unsub_rate],
        unsubscribed: attributes.key?("unsubscribed") ? attributes["unsubscribed"] : attributes[:unsubscribed],
        dmarc_alignment_failure_rate7d: attributes.key?("dmarcAlignmentFailureRate7d") ? attributes["dmarcAlignmentFailureRate7d"] : attributes[:dmarc_alignment_failure_rate7d],
        dmarc_domain: attributes.key?("dmarcDomain") ? attributes["dmarcDomain"] : attributes[:dmarc_domain],
        dmarc_current_policy: attributes.key?("dmarcCurrentPolicy") ? attributes["dmarcCurrentPolicy"] : attributes[:dmarc_current_policy],
        dmarc_recommended_policy: attributes.key?("dmarcRecommendedPolicy") ? attributes["dmarcRecommendedPolicy"] : attributes[:dmarc_recommended_policy],
        dmarc_observed_messages: attributes.key?("dmarcObservedMessages") ? attributes["dmarcObservedMessages"] : attributes[:dmarc_observed_messages],
        dmarc_aligned_messages: attributes.key?("dmarcAlignedMessages") ? attributes["dmarcAlignedMessages"] : attributes[:dmarc_aligned_messages],
        dmarc_accounted_rate: attributes.key?("dmarcAccountedRate") ? attributes["dmarcAccountedRate"] : attributes[:dmarc_accounted_rate],
        dmarc_unknown_messages: attributes.key?("dmarcUnknownMessages") ? attributes["dmarcUnknownMessages"] : attributes[:dmarc_unknown_messages],
        dmarc_unknown_sources: attributes.key?("dmarcUnknownSources") ? attributes["dmarcUnknownSources"] : attributes[:dmarc_unknown_sources],
        dmarc_reporting_days: attributes.key?("dmarcReportingDays") ? attributes["dmarcReportingDays"] : attributes[:dmarc_reporting_days],
      )
    end
  end

  # Schema type: AdvisorRecommendationResponse
  class AdvisorRecommendationResponse
    # @return [String]
    attr_accessor :code
    # @return [String]
    attr_accessor :severity
    # @return [String]
    attr_accessor :title
    # @return [String]
    attr_accessor :message
    # @return [AdvisorRecommendationDataResponse, nil]
    attr_accessor :data

    # @param code [String], severity [String], title [String], message [String], data [AdvisorRecommendationDataResponse, nil]
    def initialize(code: , severity: , title: , message: , data: nil)
      @code = code
      @severity = severity
      @title = title
      @message = message
      @data = data
    end

    # @return [Hash] a hash representation of this object
    def to_h
      {
        code: @code,
        severity: @severity,
        title: @title,
        message: @message,
        data: @data,
      }.compact
    end

    # Create an instance from a parsed JSON hash.
    # @param attributes [Hash]
    # @return [AdvisorRecommendationResponse]
    def self.from_json(attributes)
      return nil unless attributes.is_a?(Hash)

      new(
        code: attributes.key?("code") ? attributes["code"] : attributes[:code],
        severity: attributes.key?("severity") ? attributes["severity"] : attributes[:severity],
        title: attributes.key?("title") ? attributes["title"] : attributes[:title],
        message: attributes.key?("message") ? attributes["message"] : attributes[:message],
        data: attributes.key?("data") ? attributes["data"] : attributes[:data],
      )
    end
  end

  # Schema type: AdvisorReportResponse
  class AdvisorReportResponse
    # @return [String]
    attr_accessor :project_id
    # @return [String]
    attr_accessor :generated_at
    # @return [Integer]
    attr_accessor :score
    # @return [Array<AdvisorRecommendationResponse>]
    attr_accessor :recommendations

    # @param project_id [String], generated_at [String], score [Integer], recommendations [Array<AdvisorRecommendationResponse>]
    def initialize(project_id: , generated_at: , score: , recommendations: )
      @project_id = project_id
      @generated_at = generated_at
      @score = score
      @recommendations = recommendations
    end

    # @return [Hash] a hash representation of this object
    def to_h
      {
        project_id: @project_id,
        generated_at: @generated_at,
        score: @score,
        recommendations: @recommendations,
      }.compact
    end

    # Create an instance from a parsed JSON hash.
    # @param attributes [Hash]
    # @return [AdvisorReportResponse]
    def self.from_json(attributes)
      return nil unless attributes.is_a?(Hash)

      new(
        project_id: attributes.key?("projectId") ? attributes["projectId"] : attributes[:project_id],
        generated_at: attributes.key?("generatedAt") ? attributes["generatedAt"] : attributes[:generated_at],
        score: attributes.key?("score") ? attributes["score"] : attributes[:score],
        recommendations: attributes.key?("recommendations") ? attributes["recommendations"] : attributes[:recommendations],
      )
    end
  end

  # Schema type: SuppressionResponse
  class SuppressionResponse
    # @return [String]
    attr_accessor :id
    # @return [String]
    attr_accessor :project_id
    # @return [String]
    attr_accessor :email
    # @return [String]
    attr_accessor :reason
    # @return [String]
    attr_accessor :created_at
    # @return [String, nil]
    attr_accessor :contact_id

    # @param id [String], project_id [String], email [String], reason [String], created_at [String], contact_id [String, nil]
    def initialize(id: , project_id: , email: , reason: , created_at: , contact_id: nil)
      @id = id
      @project_id = project_id
      @email = email
      @reason = reason
      @created_at = created_at
      @contact_id = contact_id
    end

    # @return [Hash] a hash representation of this object
    def to_h
      {
        id: @id,
        project_id: @project_id,
        email: @email,
        reason: @reason,
        created_at: @created_at,
        contact_id: @contact_id,
      }.compact
    end

    # Create an instance from a parsed JSON hash.
    # @param attributes [Hash]
    # @return [SuppressionResponse]
    def self.from_json(attributes)
      return nil unless attributes.is_a?(Hash)

      new(
        id: attributes.key?("id") ? attributes["id"] : attributes[:id],
        project_id: attributes.key?("projectId") ? attributes["projectId"] : attributes[:project_id],
        email: attributes.key?("email") ? attributes["email"] : attributes[:email],
        reason: attributes.key?("reason") ? attributes["reason"] : attributes[:reason],
        created_at: attributes.key?("createdAt") ? attributes["createdAt"] : attributes[:created_at],
        contact_id: attributes.key?("contactId") ? attributes["contactId"] : attributes[:contact_id],
      )
    end
  end

  # Schema type: PageInfo
  class PageInfo
    # @return [Integer]
    attr_accessor :page
    # @return [Integer]
    attr_accessor :size
    # @return [Integer]
    attr_accessor :total
    # @return [Integer]
    attr_accessor :total_pages
    # @return [Boolean]
    attr_accessor :has_next_page
    # @return [Boolean]
    attr_accessor :has_previous_page

    # @param page [Integer], size [Integer], total [Integer], total_pages [Integer], has_next_page [Boolean], has_previous_page [Boolean]
    def initialize(page: , size: , total: , total_pages: , has_next_page: , has_previous_page: )
      @page = page
      @size = size
      @total = total
      @total_pages = total_pages
      @has_next_page = has_next_page
      @has_previous_page = has_previous_page
    end

    # @return [Hash] a hash representation of this object
    def to_h
      {
        page: @page,
        size: @size,
        total: @total,
        total_pages: @total_pages,
        has_next_page: @has_next_page,
        has_previous_page: @has_previous_page,
      }.compact
    end

    # Create an instance from a parsed JSON hash.
    # @param attributes [Hash]
    # @return [PageInfo]
    def self.from_json(attributes)
      return nil unless attributes.is_a?(Hash)

      new(
        page: attributes.key?("page") ? attributes["page"] : attributes[:page],
        size: attributes.key?("size") ? attributes["size"] : attributes[:size],
        total: attributes.key?("total") ? attributes["total"] : attributes[:total],
        total_pages: attributes.key?("totalPages") ? attributes["totalPages"] : attributes[:total_pages],
        has_next_page: attributes.key?("hasNextPage") ? attributes["hasNextPage"] : attributes[:has_next_page],
        has_previous_page: attributes.key?("hasPreviousPage") ? attributes["hasPreviousPage"] : attributes[:has_previous_page],
      )
    end
  end

  # Schema type: SuppressionPageResponse
  class SuppressionPageResponse
    # @return [Array<SuppressionResponse>]
    attr_accessor :data
    # @return [PageInfo]
    attr_accessor :page

    # @param data [Array<SuppressionResponse>], page [PageInfo]
    def initialize(data: , page: )
      @data = data
      @page = page
    end

    # @return [Hash] a hash representation of this object
    def to_h
      {
        data: @data,
        page: @page,
      }.compact
    end

    # Create an instance from a parsed JSON hash.
    # @param attributes [Hash]
    # @return [SuppressionPageResponse]
    def self.from_json(attributes)
      return nil unless attributes.is_a?(Hash)

      new(
        data: attributes.key?("data") ? attributes["data"] : attributes[:data],
        page: attributes.key?("page") ? attributes["page"] : attributes[:page],
      )
    end
  end

  # Schema type: AddSuppressionBody
  class AddSuppressionBody
    # @return [String]
    attr_accessor :email

    # @param email [String]
    def initialize(email: )
      @email = email
    end

    # @return [Hash] a hash representation of this object
    def to_h
      {
        email: @email,
      }.compact
    end

    # Create an instance from a parsed JSON hash.
    # @param attributes [Hash]
    # @return [AddSuppressionBody]
    def self.from_json(attributes)
      return nil unless attributes.is_a?(Hash)

      new(
        email: attributes.key?("email") ? attributes["email"] : attributes[:email],
      )
    end
  end

  # Schema type: SuppressionImportRowSerializable
  class SuppressionImportRowSerializable
    # @return [String]
    attr_accessor :email
    # @return [String, nil]
    attr_accessor :reason

    # @param email [String], reason [String, nil]
    def initialize(email: , reason: nil)
      @email = email
      @reason = reason
    end

    # @return [Hash] a hash representation of this object
    def to_h
      {
        email: @email,
        reason: @reason,
      }.compact
    end

    # Create an instance from a parsed JSON hash.
    # @param attributes [Hash]
    # @return [SuppressionImportRowSerializable]
    def self.from_json(attributes)
      return nil unless attributes.is_a?(Hash)

      new(
        email: attributes.key?("email") ? attributes["email"] : attributes[:email],
        reason: attributes.key?("reason") ? attributes["reason"] : attributes[:reason],
      )
    end
  end

  # Schema type: SuppressionImportBody
  class SuppressionImportBody
    # @return [Array<SuppressionImportRowSerializable>]
    attr_accessor :suppressions

    # @param suppressions [Array<SuppressionImportRowSerializable>]
    def initialize(suppressions: )
      @suppressions = suppressions
    end

    # @return [Hash] a hash representation of this object
    def to_h
      {
        suppressions: @suppressions,
      }.compact
    end

    # Create an instance from a parsed JSON hash.
    # @param attributes [Hash]
    # @return [SuppressionImportBody]
    def self.from_json(attributes)
      return nil unless attributes.is_a?(Hash)

      new(
        suppressions: attributes.key?("suppressions") ? attributes["suppressions"] : attributes[:suppressions],
      )
    end
  end

  # Schema type: SuppressionImportResponse
  class SuppressionImportResponse
    # @return [Integer]
    attr_accessor :imported
    # @return [Integer]
    attr_accessor :skipped

    # @param imported [Integer], skipped [Integer]
    def initialize(imported: , skipped: )
      @imported = imported
      @skipped = skipped
    end

    # @return [Hash] a hash representation of this object
    def to_h
      {
        imported: @imported,
        skipped: @skipped,
      }.compact
    end

    # Create an instance from a parsed JSON hash.
    # @param attributes [Hash]
    # @return [SuppressionImportResponse]
    def self.from_json(attributes)
      return nil unless attributes.is_a?(Hash)

      new(
        imported: attributes.key?("imported") ? attributes["imported"] : attributes[:imported],
        skipped: attributes.key?("skipped") ? attributes["skipped"] : attributes[:skipped],
      )
    end
  end

  # Schema type: SegmentResponse
  class SegmentResponse
    # @return [String]
    attr_accessor :object
    # @return [String]
    attr_accessor :id
    # @return [String]
    attr_accessor :name
    # @return [String]
    attr_accessor :project_id
    # @return [String]
    attr_accessor :created_at
    # @return [Integer]
    attr_accessor :contact_count
    # @return [Integer]
    attr_accessor :unsubscribed_count

    # @param object [String], id [String], name [String], project_id [String], created_at [String], contact_count [Integer], unsubscribed_count [Integer]
    def initialize(object: nil, id: , name: , project_id: , created_at: , contact_count: nil, unsubscribed_count: nil)
      @object = object
      @id = id
      @name = name
      @project_id = project_id
      @created_at = created_at
      @contact_count = contact_count
      @unsubscribed_count = unsubscribed_count
    end

    # @return [Hash] a hash representation of this object
    def to_h
      {
        object: @object,
        id: @id,
        name: @name,
        project_id: @project_id,
        created_at: @created_at,
        contact_count: @contact_count,
        unsubscribed_count: @unsubscribed_count,
      }.compact
    end

    # Create an instance from a parsed JSON hash.
    # @param attributes [Hash]
    # @return [SegmentResponse]
    def self.from_json(attributes)
      return nil unless attributes.is_a?(Hash)

      new(
        object: attributes.key?("object") ? attributes["object"] : attributes[:object],
        id: attributes.key?("id") ? attributes["id"] : attributes[:id],
        name: attributes.key?("name") ? attributes["name"] : attributes[:name],
        project_id: attributes.key?("projectId") ? attributes["projectId"] : attributes[:project_id],
        created_at: attributes.key?("createdAt") ? attributes["createdAt"] : attributes[:created_at],
        contact_count: attributes.key?("contactCount") ? attributes["contactCount"] : attributes[:contact_count],
        unsubscribed_count: attributes.key?("unsubscribedCount") ? attributes["unsubscribedCount"] : attributes[:unsubscribed_count],
      )
    end
  end

  # Schema type: SegmentPageResponse
  class SegmentPageResponse
    # @return [Array<SegmentResponse>]
    attr_accessor :data
    # @return [PageInfo]
    attr_accessor :page

    # @param data [Array<SegmentResponse>], page [PageInfo]
    def initialize(data: , page: )
      @data = data
      @page = page
    end

    # @return [Hash] a hash representation of this object
    def to_h
      {
        data: @data,
        page: @page,
      }.compact
    end

    # Create an instance from a parsed JSON hash.
    # @param attributes [Hash]
    # @return [SegmentPageResponse]
    def self.from_json(attributes)
      return nil unless attributes.is_a?(Hash)

      new(
        data: attributes.key?("data") ? attributes["data"] : attributes[:data],
        page: attributes.key?("page") ? attributes["page"] : attributes[:page],
      )
    end
  end

  # Schema type: SegmentContactResponse
  class SegmentContactResponse
    # @return [String]
    attr_accessor :contact_id
    # @return [String]
    attr_accessor :email
    # @return [String, nil]
    attr_accessor :first_name
    # @return [String, nil]
    attr_accessor :last_name
    # @return [Array<String>]
    attr_accessor :segments

    # @param contact_id [String], email [String], first_name [String, nil], last_name [String, nil], segments [Array<String>]
    def initialize(contact_id: , email: , first_name: , last_name: , segments: )
      @contact_id = contact_id
      @email = email
      @first_name = first_name
      @last_name = last_name
      @segments = segments
    end

    # @return [Hash] a hash representation of this object
    def to_h
      {
        contact_id: @contact_id,
        email: @email,
        first_name: @first_name,
        last_name: @last_name,
        segments: @segments,
      }.compact
    end

    # Create an instance from a parsed JSON hash.
    # @param attributes [Hash]
    # @return [SegmentContactResponse]
    def self.from_json(attributes)
      return nil unless attributes.is_a?(Hash)

      new(
        contact_id: attributes.key?("contactId") ? attributes["contactId"] : attributes[:contact_id],
        email: attributes.key?("email") ? attributes["email"] : attributes[:email],
        first_name: attributes.key?("firstName") ? attributes["firstName"] : attributes[:first_name],
        last_name: attributes.key?("lastName") ? attributes["lastName"] : attributes[:last_name],
        segments: attributes.key?("segments") ? attributes["segments"] : attributes[:segments],
      )
    end
  end

  # Schema type: CursorInfo
  class CursorInfo
    # @return [String, nil]
    attr_accessor :next_cursor
    # @return [String, nil]
    attr_accessor :previous_cursor
    # @return [Boolean]
    attr_accessor :has_next_page
    # @return [Boolean]
    attr_accessor :has_previous_page

    # @param next_cursor [String, nil], previous_cursor [String, nil], has_next_page [Boolean], has_previous_page [Boolean]
    def initialize(next_cursor: , previous_cursor: , has_next_page: , has_previous_page: )
      @next_cursor = next_cursor
      @previous_cursor = previous_cursor
      @has_next_page = has_next_page
      @has_previous_page = has_previous_page
    end

    # @return [Hash] a hash representation of this object
    def to_h
      {
        next_cursor: @next_cursor,
        previous_cursor: @previous_cursor,
        has_next_page: @has_next_page,
        has_previous_page: @has_previous_page,
      }.compact
    end

    # Create an instance from a parsed JSON hash.
    # @param attributes [Hash]
    # @return [CursorInfo]
    def self.from_json(attributes)
      return nil unless attributes.is_a?(Hash)

      new(
        next_cursor: attributes.key?("nextCursor") ? attributes["nextCursor"] : attributes[:next_cursor],
        previous_cursor: attributes.key?("previousCursor") ? attributes["previousCursor"] : attributes[:previous_cursor],
        has_next_page: attributes.key?("hasNextPage") ? attributes["hasNextPage"] : attributes[:has_next_page],
        has_previous_page: attributes.key?("hasPreviousPage") ? attributes["hasPreviousPage"] : attributes[:has_previous_page],
      )
    end
  end

  # Schema type: CursorPage
  class CursorPage
    # @return [Array<SegmentContactResponse>]
    attr_accessor :data
    # @return [CursorInfo]
    attr_accessor :cursor

    # @param data [Array<SegmentContactResponse>], cursor [CursorInfo]
    def initialize(data: , cursor: )
      @data = data
      @cursor = cursor
    end

    # @return [Hash] a hash representation of this object
    def to_h
      {
        data: @data,
        cursor: @cursor,
      }.compact
    end

    # Create an instance from a parsed JSON hash.
    # @param attributes [Hash]
    # @return [CursorPage]
    def self.from_json(attributes)
      return nil unless attributes.is_a?(Hash)

      new(
        data: attributes.key?("data") ? attributes["data"] : attributes[:data],
        cursor: attributes.key?("cursor") ? attributes["cursor"] : attributes[:cursor],
      )
    end
  end

  # Schema type: CreateSegmentBody
  class CreateSegmentBody
    # @return [String]
    attr_accessor :name

    # @param name [String]
    def initialize(name: )
      @name = name
    end

    # @return [Hash] a hash representation of this object
    def to_h
      {
        name: @name,
      }.compact
    end

    # Create an instance from a parsed JSON hash.
    # @param attributes [Hash]
    # @return [CreateSegmentBody]
    def self.from_json(attributes)
      return nil unless attributes.is_a?(Hash)

      new(
        name: attributes.key?("name") ? attributes["name"] : attributes[:name],
      )
    end
  end

  # Schema type: TopicResponse
  class TopicResponse
    # @return [String]
    attr_accessor :object
    # @return [String]
    attr_accessor :id
    # @return [String]
    attr_accessor :name
    # @return [String]
    attr_accessor :default_subscription
    # @return [String, nil]
    attr_accessor :description
    # @return [String]
    attr_accessor :visibility
    # @return [String]
    attr_accessor :project_id
    # @return [Integer]
    attr_accessor :opt_in_count
    # @return [Integer]
    attr_accessor :opt_out_count
    # @return [String]
    attr_accessor :created_at
    # @return [String]
    attr_accessor :updated_at

    # @param object [String], id [String], name [String], default_subscription [String], description [String, nil], visibility [String], project_id [String], opt_in_count [Integer], opt_out_count [Integer], created_at [String], updated_at [String]
    def initialize(object: nil, id: , name: , default_subscription: , description: , visibility: , project_id: , opt_in_count: , opt_out_count: , created_at: , updated_at: )
      @object = object
      @id = id
      @name = name
      @default_subscription = default_subscription
      @description = description
      @visibility = visibility
      @project_id = project_id
      @opt_in_count = opt_in_count
      @opt_out_count = opt_out_count
      @created_at = created_at
      @updated_at = updated_at
    end

    # @return [Hash] a hash representation of this object
    def to_h
      {
        object: @object,
        id: @id,
        name: @name,
        default_subscription: @default_subscription,
        description: @description,
        visibility: @visibility,
        project_id: @project_id,
        opt_in_count: @opt_in_count,
        opt_out_count: @opt_out_count,
        created_at: @created_at,
        updated_at: @updated_at,
      }.compact
    end

    # Create an instance from a parsed JSON hash.
    # @param attributes [Hash]
    # @return [TopicResponse]
    def self.from_json(attributes)
      return nil unless attributes.is_a?(Hash)

      new(
        object: attributes.key?("object") ? attributes["object"] : attributes[:object],
        id: attributes.key?("id") ? attributes["id"] : attributes[:id],
        name: attributes.key?("name") ? attributes["name"] : attributes[:name],
        default_subscription: attributes.key?("defaultSubscription") ? attributes["defaultSubscription"] : attributes[:default_subscription],
        description: attributes.key?("description") ? attributes["description"] : attributes[:description],
        visibility: attributes.key?("visibility") ? attributes["visibility"] : attributes[:visibility],
        project_id: attributes.key?("projectId") ? attributes["projectId"] : attributes[:project_id],
        opt_in_count: attributes.key?("optInCount") ? attributes["optInCount"] : attributes[:opt_in_count],
        opt_out_count: attributes.key?("optOutCount") ? attributes["optOutCount"] : attributes[:opt_out_count],
        created_at: attributes.key?("createdAt") ? attributes["createdAt"] : attributes[:created_at],
        updated_at: attributes.key?("updatedAt") ? attributes["updatedAt"] : attributes[:updated_at],
      )
    end
  end

  # Schema type: TopicPageResponse
  class TopicPageResponse
    # @return [Array<TopicResponse>]
    attr_accessor :data
    # @return [PageInfo]
    attr_accessor :page

    # @param data [Array<TopicResponse>], page [PageInfo]
    def initialize(data: , page: )
      @data = data
      @page = page
    end

    # @return [Hash] a hash representation of this object
    def to_h
      {
        data: @data,
        page: @page,
      }.compact
    end

    # Create an instance from a parsed JSON hash.
    # @param attributes [Hash]
    # @return [TopicPageResponse]
    def self.from_json(attributes)
      return nil unless attributes.is_a?(Hash)

      new(
        data: attributes.key?("data") ? attributes["data"] : attributes[:data],
        page: attributes.key?("page") ? attributes["page"] : attributes[:page],
      )
    end
  end

  # Schema type: CreateTopicBody
  class CreateTopicBody
    # @return [String]
    attr_accessor :name
    # @return [String]
    attr_accessor :default_subscription
    # @return [String, nil]
    attr_accessor :description
    # @return [String, nil]
    attr_accessor :visibility

    # @param name [String], default_subscription [String], description [String, nil], visibility [String, nil]
    def initialize(name: , default_subscription: , description: nil, visibility: nil)
      @name = name
      @default_subscription = default_subscription
      @description = description
      @visibility = visibility
    end

    # @return [Hash] a hash representation of this object
    def to_h
      {
        name: @name,
        default_subscription: @default_subscription,
        description: @description,
        visibility: @visibility,
      }.compact
    end

    # Create an instance from a parsed JSON hash.
    # @param attributes [Hash]
    # @return [CreateTopicBody]
    def self.from_json(attributes)
      return nil unless attributes.is_a?(Hash)

      new(
        name: attributes.key?("name") ? attributes["name"] : attributes[:name],
        default_subscription: attributes.key?("defaultSubscription") ? attributes["defaultSubscription"] : attributes[:default_subscription],
        description: attributes.key?("description") ? attributes["description"] : attributes[:description],
        visibility: attributes.key?("visibility") ? attributes["visibility"] : attributes[:visibility],
      )
    end
  end

  # Schema type: UpdateTopicBody
  class UpdateTopicBody
    # @return [String, nil]
    attr_accessor :name
    # @return [String, nil]
    attr_accessor :description
    # @return [String, nil]
    attr_accessor :visibility

    # @param name [String, nil], description [String, nil], visibility [String, nil]
    def initialize(name: nil, description: nil, visibility: nil)
      @name = name
      @description = description
      @visibility = visibility
    end

    # @return [Hash] a hash representation of this object
    def to_h
      {
        name: @name,
        description: @description,
        visibility: @visibility,
      }.compact
    end

    # Create an instance from a parsed JSON hash.
    # @param attributes [Hash]
    # @return [UpdateTopicBody]
    def self.from_json(attributes)
      return nil unless attributes.is_a?(Hash)

      new(
        name: attributes.key?("name") ? attributes["name"] : attributes[:name],
        description: attributes.key?("description") ? attributes["description"] : attributes[:description],
        visibility: attributes.key?("visibility") ? attributes["visibility"] : attributes[:visibility],
      )
    end
  end

  # Schema type: ContactPropertyResponse
  class ContactPropertyResponse
    # @return [String]
    attr_accessor :object
    # @return [String]
    attr_accessor :id
    # @return [String]
    attr_accessor :key
    # @return [String]
    attr_accessor :type
    # @return [String, nil]
    attr_accessor :fallback_value
    # @return [String]
    attr_accessor :project_id
    # @return [String]
    attr_accessor :created_at
    # @return [String]
    attr_accessor :updated_at

    # @param object [String], id [String], key [String], type [String], fallback_value [String, nil], project_id [String], created_at [String], updated_at [String]
    def initialize(object: nil, id: , key: , type: , fallback_value: , project_id: , created_at: , updated_at: )
      @object = object
      @id = id
      @key = key
      @type = type
      @fallback_value = fallback_value
      @project_id = project_id
      @created_at = created_at
      @updated_at = updated_at
    end

    # @return [Hash] a hash representation of this object
    def to_h
      {
        object: @object,
        id: @id,
        key: @key,
        type: @type,
        fallback_value: @fallback_value,
        project_id: @project_id,
        created_at: @created_at,
        updated_at: @updated_at,
      }.compact
    end

    # Create an instance from a parsed JSON hash.
    # @param attributes [Hash]
    # @return [ContactPropertyResponse]
    def self.from_json(attributes)
      return nil unless attributes.is_a?(Hash)

      new(
        object: attributes.key?("object") ? attributes["object"] : attributes[:object],
        id: attributes.key?("id") ? attributes["id"] : attributes[:id],
        key: attributes.key?("key") ? attributes["key"] : attributes[:key],
        type: attributes.key?("type") ? attributes["type"] : attributes[:type],
        fallback_value: attributes.key?("fallbackValue") ? attributes["fallbackValue"] : attributes[:fallback_value],
        project_id: attributes.key?("projectId") ? attributes["projectId"] : attributes[:project_id],
        created_at: attributes.key?("createdAt") ? attributes["createdAt"] : attributes[:created_at],
        updated_at: attributes.key?("updatedAt") ? attributes["updatedAt"] : attributes[:updated_at],
      )
    end
  end

  # Schema type: ContactPropertyPageResponse
  class ContactPropertyPageResponse
    # @return [Array<ContactPropertyResponse>]
    attr_accessor :data
    # @return [PageInfo]
    attr_accessor :page

    # @param data [Array<ContactPropertyResponse>], page [PageInfo]
    def initialize(data: , page: )
      @data = data
      @page = page
    end

    # @return [Hash] a hash representation of this object
    def to_h
      {
        data: @data,
        page: @page,
      }.compact
    end

    # Create an instance from a parsed JSON hash.
    # @param attributes [Hash]
    # @return [ContactPropertyPageResponse]
    def self.from_json(attributes)
      return nil unless attributes.is_a?(Hash)

      new(
        data: attributes.key?("data") ? attributes["data"] : attributes[:data],
        page: attributes.key?("page") ? attributes["page"] : attributes[:page],
      )
    end
  end

  # Schema type: CreateContactPropertyBody
  class CreateContactPropertyBody
    # @return [String]
    attr_accessor :key
    # @return [String]
    attr_accessor :type
    # @return [String, nil]
    attr_accessor :fallback_value

    # @param key [String], type [String], fallback_value [String, nil]
    def initialize(key: , type: , fallback_value: nil)
      @key = key
      @type = type
      @fallback_value = fallback_value
    end

    # @return [Hash] a hash representation of this object
    def to_h
      {
        key: @key,
        type: @type,
        fallback_value: @fallback_value,
      }.compact
    end

    # Create an instance from a parsed JSON hash.
    # @param attributes [Hash]
    # @return [CreateContactPropertyBody]
    def self.from_json(attributes)
      return nil unless attributes.is_a?(Hash)

      new(
        key: attributes.key?("key") ? attributes["key"] : attributes[:key],
        type: attributes.key?("type") ? attributes["type"] : attributes[:type],
        fallback_value: attributes.key?("fallbackValue") ? attributes["fallbackValue"] : attributes[:fallback_value],
      )
    end
  end

  # Schema type: UpdateContactPropertyBody
  class UpdateContactPropertyBody
    # @return [String, nil]
    attr_accessor :fallback_value

    # @param fallback_value [String, nil]
    def initialize(fallback_value: nil)
      @fallback_value = fallback_value
    end

    # @return [Hash] a hash representation of this object
    def to_h
      {
        fallback_value: @fallback_value,
      }.compact
    end

    # Create an instance from a parsed JSON hash.
    # @param attributes [Hash]
    # @return [UpdateContactPropertyBody]
    def self.from_json(attributes)
      return nil unless attributes.is_a?(Hash)

      new(
        fallback_value: attributes.key?("fallbackValue") ? attributes["fallbackValue"] : attributes[:fallback_value],
      )
    end
  end

  # Schema type: TopicSubscriptionResponse
  class TopicSubscriptionResponse
    # @return [String]
    attr_accessor :topic_id
    # @return [String]
    attr_accessor :subscription

    # @param topic_id [String], subscription [String]
    def initialize(topic_id: , subscription: )
      @topic_id = topic_id
      @subscription = subscription
    end

    # @return [Hash] a hash representation of this object
    def to_h
      {
        topic_id: @topic_id,
        subscription: @subscription,
      }.compact
    end

    # Create an instance from a parsed JSON hash.
    # @param attributes [Hash]
    # @return [TopicSubscriptionResponse]
    def self.from_json(attributes)
      return nil unless attributes.is_a?(Hash)

      new(
        topic_id: attributes.key?("topicId") ? attributes["topicId"] : attributes[:topic_id],
        subscription: attributes.key?("subscription") ? attributes["subscription"] : attributes[:subscription],
      )
    end
  end

  # Schema type: ContactResponse
  class ContactResponse
    # @return [String]
    attr_accessor :object
    # @return [String]
    attr_accessor :id
    # @return [String]
    attr_accessor :email
    # @return [String, nil]
    attr_accessor :phone
    # @return [String, nil]
    attr_accessor :first_name
    # @return [String, nil]
    attr_accessor :last_name
    # @return [Boolean]
    attr_accessor :unsubscribed
    # @return [Hash{String => String}]
    attr_accessor :properties
    # @return [String, nil]
    attr_accessor :profile_image_url
    # @return [String]
    attr_accessor :project_id
    # @return [Array<String>]
    attr_accessor :segments
    # @return [Array<TopicSubscriptionResponse>]
    attr_accessor :topics
    # @return [String]
    attr_accessor :created_at
    # @return [String]
    attr_accessor :updated_at

    # @param object [String], id [String], email [String], phone [String, nil], first_name [String, nil], last_name [String, nil], unsubscribed [Boolean], properties [Hash{String => String}], profile_image_url [String, nil], project_id [String], segments [Array<String>], topics [Array<TopicSubscriptionResponse>], created_at [String], updated_at [String]
    def initialize(object: nil, id: , email: , phone: nil, first_name: , last_name: , unsubscribed: , properties: , profile_image_url: , project_id: , segments: , topics: , created_at: , updated_at: )
      @object = object
      @id = id
      @email = email
      @phone = phone
      @first_name = first_name
      @last_name = last_name
      @unsubscribed = unsubscribed
      @properties = properties
      @profile_image_url = profile_image_url
      @project_id = project_id
      @segments = segments
      @topics = topics
      @created_at = created_at
      @updated_at = updated_at
    end

    # @return [Hash] a hash representation of this object
    def to_h
      {
        object: @object,
        id: @id,
        email: @email,
        phone: @phone,
        first_name: @first_name,
        last_name: @last_name,
        unsubscribed: @unsubscribed,
        properties: @properties,
        profile_image_url: @profile_image_url,
        project_id: @project_id,
        segments: @segments,
        topics: @topics,
        created_at: @created_at,
        updated_at: @updated_at,
      }.compact
    end

    # Create an instance from a parsed JSON hash.
    # @param attributes [Hash]
    # @return [ContactResponse]
    def self.from_json(attributes)
      return nil unless attributes.is_a?(Hash)

      new(
        object: attributes.key?("object") ? attributes["object"] : attributes[:object],
        id: attributes.key?("id") ? attributes["id"] : attributes[:id],
        email: attributes.key?("email") ? attributes["email"] : attributes[:email],
        phone: attributes.key?("phone") ? attributes["phone"] : attributes[:phone],
        first_name: attributes.key?("firstName") ? attributes["firstName"] : attributes[:first_name],
        last_name: attributes.key?("lastName") ? attributes["lastName"] : attributes[:last_name],
        unsubscribed: attributes.key?("unsubscribed") ? attributes["unsubscribed"] : attributes[:unsubscribed],
        properties: attributes.key?("properties") ? attributes["properties"] : attributes[:properties],
        profile_image_url: attributes.key?("profileImageUrl") ? attributes["profileImageUrl"] : attributes[:profile_image_url],
        project_id: attributes.key?("projectId") ? attributes["projectId"] : attributes[:project_id],
        segments: attributes.key?("segments") ? attributes["segments"] : attributes[:segments],
        topics: attributes.key?("topics") ? attributes["topics"] : attributes[:topics],
        created_at: attributes.key?("createdAt") ? attributes["createdAt"] : attributes[:created_at],
        updated_at: attributes.key?("updatedAt") ? attributes["updatedAt"] : attributes[:updated_at],
      )
    end
  end

  # Schema type: ContactPageResponse
  class ContactPageResponse
    # @return [Array<ContactResponse>]
    attr_accessor :data
    # @return [PageInfo]
    attr_accessor :page

    # @param data [Array<ContactResponse>], page [PageInfo]
    def initialize(data: , page: )
      @data = data
      @page = page
    end

    # @return [Hash] a hash representation of this object
    def to_h
      {
        data: @data,
        page: @page,
      }.compact
    end

    # Create an instance from a parsed JSON hash.
    # @param attributes [Hash]
    # @return [ContactPageResponse]
    def self.from_json(attributes)
      return nil unless attributes.is_a?(Hash)

      new(
        data: attributes.key?("data") ? attributes["data"] : attributes[:data],
        page: attributes.key?("page") ? attributes["page"] : attributes[:page],
      )
    end
  end

  # Schema type: SegmentRef
  class SegmentRef
    # @return [String]
    attr_accessor :id

    # @param id [String]
    def initialize(id: )
      @id = id
    end

    # @return [Hash] a hash representation of this object
    def to_h
      {
        id: @id,
      }.compact
    end

    # Create an instance from a parsed JSON hash.
    # @param attributes [Hash]
    # @return [SegmentRef]
    def self.from_json(attributes)
      return nil unless attributes.is_a?(Hash)

      new(
        id: attributes.key?("id") ? attributes["id"] : attributes[:id],
      )
    end
  end

  # Schema type: TopicSubscriptionBody
  class TopicSubscriptionBody
    # @return [String]
    attr_accessor :id
    # @return [String]
    attr_accessor :subscription

    # @param id [String], subscription [String]
    def initialize(id: , subscription: )
      @id = id
      @subscription = subscription
    end

    # @return [Hash] a hash representation of this object
    def to_h
      {
        id: @id,
        subscription: @subscription,
      }.compact
    end

    # Create an instance from a parsed JSON hash.
    # @param attributes [Hash]
    # @return [TopicSubscriptionBody]
    def self.from_json(attributes)
      return nil unless attributes.is_a?(Hash)

      new(
        id: attributes.key?("id") ? attributes["id"] : attributes[:id],
        subscription: attributes.key?("subscription") ? attributes["subscription"] : attributes[:subscription],
      )
    end
  end

  # Schema type: CreateContactBody
  class CreateContactBody
    # @return [String]
    attr_accessor :email
    # @return [String, nil]
    attr_accessor :phone
    # @return [String, nil]
    attr_accessor :first_name
    # @return [String, nil]
    attr_accessor :last_name
    # @return [Boolean]
    attr_accessor :unsubscribed
    # @return [Hash{String => String}]
    attr_accessor :properties
    # @return [Array<SegmentRef>]
    attr_accessor :segments
    # @return [Array<TopicSubscriptionBody>]
    attr_accessor :topics

    # @param email [String], phone [String, nil], first_name [String, nil], last_name [String, nil], unsubscribed [Boolean], properties [Hash{String => String}], segments [Array<SegmentRef>], topics [Array<TopicSubscriptionBody>]
    def initialize(email: , phone: nil, first_name: nil, last_name: nil, unsubscribed: nil, properties: nil, segments: nil, topics: nil)
      @email = email
      @phone = phone
      @first_name = first_name
      @last_name = last_name
      @unsubscribed = unsubscribed
      @properties = properties
      @segments = segments
      @topics = topics
    end

    # @return [Hash] a hash representation of this object
    def to_h
      {
        email: @email,
        phone: @phone,
        first_name: @first_name,
        last_name: @last_name,
        unsubscribed: @unsubscribed,
        properties: @properties,
        segments: @segments,
        topics: @topics,
      }.compact
    end

    # Create an instance from a parsed JSON hash.
    # @param attributes [Hash]
    # @return [CreateContactBody]
    def self.from_json(attributes)
      return nil unless attributes.is_a?(Hash)

      new(
        email: attributes.key?("email") ? attributes["email"] : attributes[:email],
        phone: attributes.key?("phone") ? attributes["phone"] : attributes[:phone],
        first_name: attributes.key?("firstName") ? attributes["firstName"] : attributes[:first_name],
        last_name: attributes.key?("lastName") ? attributes["lastName"] : attributes[:last_name],
        unsubscribed: attributes.key?("unsubscribed") ? attributes["unsubscribed"] : attributes[:unsubscribed],
        properties: attributes.key?("properties") ? attributes["properties"] : attributes[:properties],
        segments: attributes.key?("segments") ? attributes["segments"] : attributes[:segments],
        topics: attributes.key?("topics") ? attributes["topics"] : attributes[:topics],
      )
    end
  end

  # Schema type: UpdateContactBody
  class UpdateContactBody
    # @return [String, nil]
    attr_accessor :first_name
    # @return [String, nil]
    attr_accessor :last_name
    # @return [String, nil]
    attr_accessor :phone
    # @return [Boolean, nil]
    attr_accessor :unsubscribed
    # @return [Hash{String => String}]
    attr_accessor :properties

    # @param first_name [String, nil], last_name [String, nil], phone [String, nil], unsubscribed [Boolean, nil], properties [Hash{String => String}]
    def initialize(first_name: nil, last_name: nil, phone: nil, unsubscribed: nil, properties: nil)
      @first_name = first_name
      @last_name = last_name
      @phone = phone
      @unsubscribed = unsubscribed
      @properties = properties
    end

    # @return [Hash] a hash representation of this object
    def to_h
      {
        first_name: @first_name,
        last_name: @last_name,
        phone: @phone,
        unsubscribed: @unsubscribed,
        properties: @properties,
      }.compact
    end

    # Create an instance from a parsed JSON hash.
    # @param attributes [Hash]
    # @return [UpdateContactBody]
    def self.from_json(attributes)
      return nil unless attributes.is_a?(Hash)

      new(
        first_name: attributes.key?("firstName") ? attributes["firstName"] : attributes[:first_name],
        last_name: attributes.key?("lastName") ? attributes["lastName"] : attributes[:last_name],
        phone: attributes.key?("phone") ? attributes["phone"] : attributes[:phone],
        unsubscribed: attributes.key?("unsubscribed") ? attributes["unsubscribed"] : attributes[:unsubscribed],
        properties: attributes.key?("properties") ? attributes["properties"] : attributes[:properties],
      )
    end
  end

  # Schema type: SetImageUrlBody
  class SetImageUrlBody
    # @return [String]
    attr_accessor :url

    # @param url [String]
    def initialize(url: )
      @url = url
    end

    # @return [Hash] a hash representation of this object
    def to_h
      {
        url: @url,
      }.compact
    end

    # Create an instance from a parsed JSON hash.
    # @param attributes [Hash]
    # @return [SetImageUrlBody]
    def self.from_json(attributes)
      return nil unless attributes.is_a?(Hash)

      new(
        url: attributes.key?("url") ? attributes["url"] : attributes[:url],
      )
    end
  end

  # Schema type: AddToSegmentBody
  class AddToSegmentBody
    # @return [String]
    attr_accessor :segment_id

    # @param segment_id [String]
    def initialize(segment_id: )
      @segment_id = segment_id
    end

    # @return [Hash] a hash representation of this object
    def to_h
      {
        segment_id: @segment_id,
      }.compact
    end

    # Create an instance from a parsed JSON hash.
    # @param attributes [Hash]
    # @return [AddToSegmentBody]
    def self.from_json(attributes)
      return nil unless attributes.is_a?(Hash)

      new(
        segment_id: attributes.key?("segmentId") ? attributes["segmentId"] : attributes[:segment_id],
      )
    end
  end

  # Schema type: UpdateTopicsBody
  class UpdateTopicsBody
    # @return [Array<TopicSubscriptionBody>]
    attr_accessor :topics

    # @param topics [Array<TopicSubscriptionBody>]
    def initialize(topics: )
      @topics = topics
    end

    # @return [Hash] a hash representation of this object
    def to_h
      {
        topics: @topics,
      }.compact
    end

    # Create an instance from a parsed JSON hash.
    # @param attributes [Hash]
    # @return [UpdateTopicsBody]
    def self.from_json(attributes)
      return nil unless attributes.is_a?(Hash)

      new(
        topics: attributes.key?("topics") ? attributes["topics"] : attributes[:topics],
      )
    end
  end

  # Schema type: ActivityMetadataResponse
  class ActivityMetadataResponse
    # @return [String, nil]
    attr_accessor :topic_id

    # @param topic_id [String, nil]
    def initialize(topic_id: nil)
      @topic_id = topic_id
    end

    # @return [Hash] a hash representation of this object
    def to_h
      {
        topic_id: @topic_id,
      }.compact
    end

    # Create an instance from a parsed JSON hash.
    # @param attributes [Hash]
    # @return [ActivityMetadataResponse]
    def self.from_json(attributes)
      return nil unless attributes.is_a?(Hash)

      new(
        topic_id: attributes.key?("topicId") ? attributes["topicId"] : attributes[:topic_id],
      )
    end
  end

  # Schema type: ActivityResponse
  class ActivityResponse
    # @return [String]
    attr_accessor :object
    # @return [String]
    attr_accessor :id
    # @return [String]
    attr_accessor :type
    # @return [String, nil]
    attr_accessor :reference_id
    # @return [String, nil]
    attr_accessor :reference_name
    # @return [ActivityMetadataResponse, nil]
    attr_accessor :metadata
    # @return [String]
    attr_accessor :occurred_at

    # @param object [String], id [String], type [String], reference_id [String, nil], reference_name [String, nil], metadata [ActivityMetadataResponse, nil], occurred_at [String]
    def initialize(object: nil, id: , type: , reference_id: nil, reference_name: nil, metadata: nil, occurred_at: )
      @object = object
      @id = id
      @type = type
      @reference_id = reference_id
      @reference_name = reference_name
      @metadata = metadata
      @occurred_at = occurred_at
    end

    # @return [Hash] a hash representation of this object
    def to_h
      {
        object: @object,
        id: @id,
        type: @type,
        reference_id: @reference_id,
        reference_name: @reference_name,
        metadata: @metadata,
        occurred_at: @occurred_at,
      }.compact
    end

    # Create an instance from a parsed JSON hash.
    # @param attributes [Hash]
    # @return [ActivityResponse]
    def self.from_json(attributes)
      return nil unless attributes.is_a?(Hash)

      new(
        object: attributes.key?("object") ? attributes["object"] : attributes[:object],
        id: attributes.key?("id") ? attributes["id"] : attributes[:id],
        type: attributes.key?("type") ? attributes["type"] : attributes[:type],
        reference_id: attributes.key?("referenceId") ? attributes["referenceId"] : attributes[:reference_id],
        reference_name: attributes.key?("referenceName") ? attributes["referenceName"] : attributes[:reference_name],
        metadata: attributes.key?("metadata") ? attributes["metadata"] : attributes[:metadata],
        occurred_at: attributes.key?("occurredAt") ? attributes["occurredAt"] : attributes[:occurred_at],
      )
    end
  end

  # Schema type: EngagementScoreResponse
  class EngagementScoreResponse
    # @return [String]
    attr_accessor :object
    # @return [Integer]
    attr_accessor :score
    # @return [String]
    attr_accessor :tier
    # @return [String]
    attr_accessor :scored_at

    # @param object [String], score [Integer], tier [String], scored_at [String]
    def initialize(object: nil, score: , tier: , scored_at: )
      @object = object
      @score = score
      @tier = tier
      @scored_at = scored_at
    end

    # @return [Hash] a hash representation of this object
    def to_h
      {
        object: @object,
        score: @score,
        tier: @tier,
        scored_at: @scored_at,
      }.compact
    end

    # Create an instance from a parsed JSON hash.
    # @param attributes [Hash]
    # @return [EngagementScoreResponse]
    def self.from_json(attributes)
      return nil unless attributes.is_a?(Hash)

      new(
        object: attributes.key?("object") ? attributes["object"] : attributes[:object],
        score: attributes.key?("score") ? attributes["score"] : attributes[:score],
        tier: attributes.key?("tier") ? attributes["tier"] : attributes[:tier],
        scored_at: attributes.key?("scoredAt") ? attributes["scoredAt"] : attributes[:scored_at],
      )
    end
  end

  # Schema type: EmailValidationStatusResponse
  class EmailValidationStatusResponse
    # @return [String]
    attr_accessor :object
    # @return [String]
    attr_accessor :status
    # @return [String, nil]
    attr_accessor :reason
    # @return [String, nil]
    attr_accessor :validated_at

    # @param object [String], status [String], reason [String, nil], validated_at [String, nil]
    def initialize(object: nil, status: , reason: , validated_at: )
      @object = object
      @status = status
      @reason = reason
      @validated_at = validated_at
    end

    # @return [Hash] a hash representation of this object
    def to_h
      {
        object: @object,
        status: @status,
        reason: @reason,
        validated_at: @validated_at,
      }.compact
    end

    # Create an instance from a parsed JSON hash.
    # @param attributes [Hash]
    # @return [EmailValidationStatusResponse]
    def self.from_json(attributes)
      return nil unless attributes.is_a?(Hash)

      new(
        object: attributes.key?("object") ? attributes["object"] : attributes[:object],
        status: attributes.key?("status") ? attributes["status"] : attributes[:status],
        reason: attributes.key?("reason") ? attributes["reason"] : attributes[:reason],
        validated_at: attributes.key?("validatedAt") ? attributes["validatedAt"] : attributes[:validated_at],
      )
    end
  end

  # Schema type: RecordValidationBody
  class RecordValidationBody
    # @return [EmailValidationStatusInput]
    attr_accessor :status
    # @return [String, nil]
    attr_accessor :reason

    # @param status [EmailValidationStatusInput], reason [String, nil]
    def initialize(status: , reason: nil)
      @status = status
      @reason = reason
    end

    # @return [Hash] a hash representation of this object
    def to_h
      {
        status: @status,
        reason: @reason,
      }.compact
    end

    # Create an instance from a parsed JSON hash.
    # @param attributes [Hash]
    # @return [RecordValidationBody]
    def self.from_json(attributes)
      return nil unless attributes.is_a?(Hash)

      new(
        status: attributes.key?("status") ? attributes["status"] : attributes[:status],
        reason: attributes.key?("reason") ? attributes["reason"] : attributes[:reason],
      )
    end
  end

  # Schema type: WebhookFilterSerializable
  class WebhookFilterSerializable
    # @return [String]
    attr_accessor :field
    # @return [String]
    attr_accessor :operator
    # @return [String, nil]
    attr_accessor :value

    # @param field [String], operator [String], value [String, nil]
    def initialize(field: , operator: , value: nil)
      @field = field
      @operator = operator
      @value = value
    end

    # @return [Hash] a hash representation of this object
    def to_h
      {
        field: @field,
        operator: @operator,
        value: @value,
      }.compact
    end

    # Create an instance from a parsed JSON hash.
    # @param attributes [Hash]
    # @return [WebhookFilterSerializable]
    def self.from_json(attributes)
      return nil unless attributes.is_a?(Hash)

      new(
        field: attributes.key?("field") ? attributes["field"] : attributes[:field],
        operator: attributes.key?("operator") ? attributes["operator"] : attributes[:operator],
        value: attributes.key?("value") ? attributes["value"] : attributes[:value],
      )
    end
  end

  # Schema type: WebhookTransformationSerializable
  class WebhookTransformationSerializable
    # @return [String]
    attr_accessor :type
    # @return [String, nil]
    attr_accessor :from
    # @return [String, nil]
    attr_accessor :to
    # @return [String, nil]
    attr_accessor :field
    # @return [String, nil]
    attr_accessor :value
    # @return [String, nil]
    attr_accessor :template

    # @param type [String], from [String, nil], to [String, nil], field [String, nil], value [String, nil], template [String, nil]
    def initialize(type: , from: nil, to: nil, field: nil, value: nil, template: nil)
      @type = type
      @from = from
      @to = to
      @field = field
      @value = value
      @template = template
    end

    # @return [Hash] a hash representation of this object
    def to_h
      {
        type: @type,
        from: @from,
        to: @to,
        field: @field,
        value: @value,
        template: @template,
      }.compact
    end

    # Create an instance from a parsed JSON hash.
    # @param attributes [Hash]
    # @return [WebhookTransformationSerializable]
    def self.from_json(attributes)
      return nil unless attributes.is_a?(Hash)

      new(
        type: attributes.key?("type") ? attributes["type"] : attributes[:type],
        from: attributes.key?("from") ? attributes["from"] : attributes[:from],
        to: attributes.key?("to") ? attributes["to"] : attributes[:to],
        field: attributes.key?("field") ? attributes["field"] : attributes[:field],
        value: attributes.key?("value") ? attributes["value"] : attributes[:value],
        template: attributes.key?("template") ? attributes["template"] : attributes[:template],
      )
    end
  end

  # Schema type: WebhookResponse
  class WebhookResponse
    # @return [String]
    attr_accessor :id
    # @return [String]
    attr_accessor :project_id
    # @return [String]
    attr_accessor :name
    # @return [String]
    attr_accessor :url
    # @return [Array<String>]
    attr_accessor :events
    # @return [Boolean]
    attr_accessor :enabled
    # @return [Array<WebhookFilterSerializable>]
    attr_accessor :filters
    # @return [Array<WebhookTransformationSerializable>]
    attr_accessor :transformations
    # @return [String]
    attr_accessor :created_at
    # @return [String]
    attr_accessor :updated_at

    # @param id [String], project_id [String], name [String], url [String], events [Array<String>], enabled [Boolean], filters [Array<WebhookFilterSerializable>], transformations [Array<WebhookTransformationSerializable>], created_at [String], updated_at [String]
    def initialize(id: , project_id: , name: , url: , events: , enabled: , filters: , transformations: , created_at: , updated_at: )
      @id = id
      @project_id = project_id
      @name = name
      @url = url
      @events = events
      @enabled = enabled
      @filters = filters
      @transformations = transformations
      @created_at = created_at
      @updated_at = updated_at
    end

    # @return [Hash] a hash representation of this object
    def to_h
      {
        id: @id,
        project_id: @project_id,
        name: @name,
        url: @url,
        events: @events,
        enabled: @enabled,
        filters: @filters,
        transformations: @transformations,
        created_at: @created_at,
        updated_at: @updated_at,
      }.compact
    end

    # Create an instance from a parsed JSON hash.
    # @param attributes [Hash]
    # @return [WebhookResponse]
    def self.from_json(attributes)
      return nil unless attributes.is_a?(Hash)

      new(
        id: attributes.key?("id") ? attributes["id"] : attributes[:id],
        project_id: attributes.key?("projectId") ? attributes["projectId"] : attributes[:project_id],
        name: attributes.key?("name") ? attributes["name"] : attributes[:name],
        url: attributes.key?("url") ? attributes["url"] : attributes[:url],
        events: attributes.key?("events") ? attributes["events"] : attributes[:events],
        enabled: attributes.key?("enabled") ? attributes["enabled"] : attributes[:enabled],
        filters: attributes.key?("filters") ? attributes["filters"] : attributes[:filters],
        transformations: attributes.key?("transformations") ? attributes["transformations"] : attributes[:transformations],
        created_at: attributes.key?("createdAt") ? attributes["createdAt"] : attributes[:created_at],
        updated_at: attributes.key?("updatedAt") ? attributes["updatedAt"] : attributes[:updated_at],
      )
    end
  end

  # Schema type: WebhookPageResponse
  class WebhookPageResponse
    # @return [Array<WebhookResponse>]
    attr_accessor :data
    # @return [PageInfo]
    attr_accessor :page

    # @param data [Array<WebhookResponse>], page [PageInfo]
    def initialize(data: , page: )
      @data = data
      @page = page
    end

    # @return [Hash] a hash representation of this object
    def to_h
      {
        data: @data,
        page: @page,
      }.compact
    end

    # Create an instance from a parsed JSON hash.
    # @param attributes [Hash]
    # @return [WebhookPageResponse]
    def self.from_json(attributes)
      return nil unless attributes.is_a?(Hash)

      new(
        data: attributes.key?("data") ? attributes["data"] : attributes[:data],
        page: attributes.key?("page") ? attributes["page"] : attributes[:page],
      )
    end
  end

  # Schema type: WebhookDeliveryResponse
  class WebhookDeliveryResponse
    # @return [String]
    attr_accessor :id
    # @return [String]
    attr_accessor :project_id
    # @return [String]
    attr_accessor :webhook_endpoint_id
    # @return [String]
    attr_accessor :event_type
    # @return [String]
    attr_accessor :status
    # @return [Integer]
    attr_accessor :attempt_count
    # @return [Integer, nil]
    attr_accessor :last_status_code
    # @return [String, nil]
    attr_accessor :last_error
    # @return [String, nil]
    attr_accessor :response_body_snippet
    # @return [String, nil]
    attr_accessor :next_attempt_at
    # @return [String]
    attr_accessor :created_at
    # @return [String]
    attr_accessor :updated_at

    # @param id [String], project_id [String], webhook_endpoint_id [String], event_type [String], status [String], attempt_count [Integer], last_status_code [Integer, nil], last_error [String, nil], response_body_snippet [String, nil], next_attempt_at [String, nil], created_at [String], updated_at [String]
    def initialize(id: , project_id: , webhook_endpoint_id: , event_type: , status: , attempt_count: , last_status_code: , last_error: , response_body_snippet: , next_attempt_at: , created_at: , updated_at: )
      @id = id
      @project_id = project_id
      @webhook_endpoint_id = webhook_endpoint_id
      @event_type = event_type
      @status = status
      @attempt_count = attempt_count
      @last_status_code = last_status_code
      @last_error = last_error
      @response_body_snippet = response_body_snippet
      @next_attempt_at = next_attempt_at
      @created_at = created_at
      @updated_at = updated_at
    end

    # @return [Hash] a hash representation of this object
    def to_h
      {
        id: @id,
        project_id: @project_id,
        webhook_endpoint_id: @webhook_endpoint_id,
        event_type: @event_type,
        status: @status,
        attempt_count: @attempt_count,
        last_status_code: @last_status_code,
        last_error: @last_error,
        response_body_snippet: @response_body_snippet,
        next_attempt_at: @next_attempt_at,
        created_at: @created_at,
        updated_at: @updated_at,
      }.compact
    end

    # Create an instance from a parsed JSON hash.
    # @param attributes [Hash]
    # @return [WebhookDeliveryResponse]
    def self.from_json(attributes)
      return nil unless attributes.is_a?(Hash)

      new(
        id: attributes.key?("id") ? attributes["id"] : attributes[:id],
        project_id: attributes.key?("projectId") ? attributes["projectId"] : attributes[:project_id],
        webhook_endpoint_id: attributes.key?("webhookEndpointId") ? attributes["webhookEndpointId"] : attributes[:webhook_endpoint_id],
        event_type: attributes.key?("eventType") ? attributes["eventType"] : attributes[:event_type],
        status: attributes.key?("status") ? attributes["status"] : attributes[:status],
        attempt_count: attributes.key?("attemptCount") ? attributes["attemptCount"] : attributes[:attempt_count],
        last_status_code: attributes.key?("lastStatusCode") ? attributes["lastStatusCode"] : attributes[:last_status_code],
        last_error: attributes.key?("lastError") ? attributes["lastError"] : attributes[:last_error],
        response_body_snippet: attributes.key?("responseBodySnippet") ? attributes["responseBodySnippet"] : attributes[:response_body_snippet],
        next_attempt_at: attributes.key?("nextAttemptAt") ? attributes["nextAttemptAt"] : attributes[:next_attempt_at],
        created_at: attributes.key?("createdAt") ? attributes["createdAt"] : attributes[:created_at],
        updated_at: attributes.key?("updatedAt") ? attributes["updatedAt"] : attributes[:updated_at],
      )
    end
  end

  # Schema type: WebhookDeliveryPageResponse
  class WebhookDeliveryPageResponse
    # @return [Array<WebhookDeliveryResponse>]
    attr_accessor :data
    # @return [PageInfo]
    attr_accessor :page

    # @param data [Array<WebhookDeliveryResponse>], page [PageInfo]
    def initialize(data: , page: )
      @data = data
      @page = page
    end

    # @return [Hash] a hash representation of this object
    def to_h
      {
        data: @data,
        page: @page,
      }.compact
    end

    # Create an instance from a parsed JSON hash.
    # @param attributes [Hash]
    # @return [WebhookDeliveryPageResponse]
    def self.from_json(attributes)
      return nil unless attributes.is_a?(Hash)

      new(
        data: attributes.key?("data") ? attributes["data"] : attributes[:data],
        page: attributes.key?("page") ? attributes["page"] : attributes[:page],
      )
    end
  end

  # Schema type: CreateWebhookBody
  class CreateWebhookBody
    # @return [String]
    attr_accessor :url
    # @return [Array<String>]
    attr_accessor :events
    # @return [String, nil]
    attr_accessor :name
    # @return [String, nil]
    attr_accessor :secret
    # @return [Array<WebhookFilterSerializable>]
    attr_accessor :filters
    # @return [Array<WebhookTransformationSerializable>]
    attr_accessor :transformations

    # @param url [String], events [Array<String>], name [String, nil], secret [String, nil], filters [Array<WebhookFilterSerializable>], transformations [Array<WebhookTransformationSerializable>]
    def initialize(url: , events: , name: nil, secret: nil, filters: nil, transformations: nil)
      @url = url
      @events = events
      @name = name
      @secret = secret
      @filters = filters
      @transformations = transformations
    end

    # @return [Hash] a hash representation of this object
    def to_h
      {
        url: @url,
        events: @events,
        name: @name,
        secret: @secret,
        filters: @filters,
        transformations: @transformations,
      }.compact
    end

    # Create an instance from a parsed JSON hash.
    # @param attributes [Hash]
    # @return [CreateWebhookBody]
    def self.from_json(attributes)
      return nil unless attributes.is_a?(Hash)

      new(
        url: attributes.key?("url") ? attributes["url"] : attributes[:url],
        events: attributes.key?("events") ? attributes["events"] : attributes[:events],
        name: attributes.key?("name") ? attributes["name"] : attributes[:name],
        secret: attributes.key?("secret") ? attributes["secret"] : attributes[:secret],
        filters: attributes.key?("filters") ? attributes["filters"] : attributes[:filters],
        transformations: attributes.key?("transformations") ? attributes["transformations"] : attributes[:transformations],
      )
    end
  end

  # Schema type: WebhookCreateResponse
  class WebhookCreateResponse
    # @return [String]
    attr_accessor :id
    # @return [String]
    attr_accessor :project_id
    # @return [String]
    attr_accessor :name
    # @return [String]
    attr_accessor :url
    # @return [Array<String>]
    attr_accessor :events
    # @return [Boolean]
    attr_accessor :enabled
    # @return [Array<WebhookFilterSerializable>]
    attr_accessor :filters
    # @return [Array<WebhookTransformationSerializable>]
    attr_accessor :transformations
    # @return [String]
    attr_accessor :created_at
    # @return [String]
    attr_accessor :updated_at
    # @return [String]
    attr_accessor :secret

    # @param id [String], project_id [String], name [String], url [String], events [Array<String>], enabled [Boolean], filters [Array<WebhookFilterSerializable>], transformations [Array<WebhookTransformationSerializable>], created_at [String], updated_at [String], secret [String]
    def initialize(id: , project_id: , name: , url: , events: , enabled: , filters: , transformations: , created_at: , updated_at: , secret: )
      @id = id
      @project_id = project_id
      @name = name
      @url = url
      @events = events
      @enabled = enabled
      @filters = filters
      @transformations = transformations
      @created_at = created_at
      @updated_at = updated_at
      @secret = secret
    end

    # @return [Hash] a hash representation of this object
    def to_h
      {
        id: @id,
        project_id: @project_id,
        name: @name,
        url: @url,
        events: @events,
        enabled: @enabled,
        filters: @filters,
        transformations: @transformations,
        created_at: @created_at,
        updated_at: @updated_at,
        secret: @secret,
      }.compact
    end

    # Create an instance from a parsed JSON hash.
    # @param attributes [Hash]
    # @return [WebhookCreateResponse]
    def self.from_json(attributes)
      return nil unless attributes.is_a?(Hash)

      new(
        id: attributes.key?("id") ? attributes["id"] : attributes[:id],
        project_id: attributes.key?("projectId") ? attributes["projectId"] : attributes[:project_id],
        name: attributes.key?("name") ? attributes["name"] : attributes[:name],
        url: attributes.key?("url") ? attributes["url"] : attributes[:url],
        events: attributes.key?("events") ? attributes["events"] : attributes[:events],
        enabled: attributes.key?("enabled") ? attributes["enabled"] : attributes[:enabled],
        filters: attributes.key?("filters") ? attributes["filters"] : attributes[:filters],
        transformations: attributes.key?("transformations") ? attributes["transformations"] : attributes[:transformations],
        created_at: attributes.key?("createdAt") ? attributes["createdAt"] : attributes[:created_at],
        updated_at: attributes.key?("updatedAt") ? attributes["updatedAt"] : attributes[:updated_at],
        secret: attributes.key?("secret") ? attributes["secret"] : attributes[:secret],
      )
    end
  end

  # Schema type: UpdateWebhookBody
  class UpdateWebhookBody
    # @return [String, nil]
    attr_accessor :name
    # @return [String, nil]
    attr_accessor :url
    # @return [Array<String>]
    attr_accessor :events
    # @return [String, nil]
    attr_accessor :secret
    # @return [Boolean, nil]
    attr_accessor :enabled
    # @return [Array<WebhookFilterSerializable>]
    attr_accessor :filters
    # @return [Array<WebhookTransformationSerializable>]
    attr_accessor :transformations

    # @param name [String, nil], url [String, nil], events [Array<String>], secret [String, nil], enabled [Boolean, nil], filters [Array<WebhookFilterSerializable>], transformations [Array<WebhookTransformationSerializable>]
    def initialize(name: nil, url: nil, events: nil, secret: nil, enabled: nil, filters: nil, transformations: nil)
      @name = name
      @url = url
      @events = events
      @secret = secret
      @enabled = enabled
      @filters = filters
      @transformations = transformations
    end

    # @return [Hash] a hash representation of this object
    def to_h
      {
        name: @name,
        url: @url,
        events: @events,
        secret: @secret,
        enabled: @enabled,
        filters: @filters,
        transformations: @transformations,
      }.compact
    end

    # Create an instance from a parsed JSON hash.
    # @param attributes [Hash]
    # @return [UpdateWebhookBody]
    def self.from_json(attributes)
      return nil unless attributes.is_a?(Hash)

      new(
        name: attributes.key?("name") ? attributes["name"] : attributes[:name],
        url: attributes.key?("url") ? attributes["url"] : attributes[:url],
        events: attributes.key?("events") ? attributes["events"] : attributes[:events],
        secret: attributes.key?("secret") ? attributes["secret"] : attributes[:secret],
        enabled: attributes.key?("enabled") ? attributes["enabled"] : attributes[:enabled],
        filters: attributes.key?("filters") ? attributes["filters"] : attributes[:filters],
        transformations: attributes.key?("transformations") ? attributes["transformations"] : attributes[:transformations],
      )
    end
  end

  # Schema type: ApiKey
  class ApiKey
    # @return [String]
    attr_accessor :id
    # @return [String]
    attr_accessor :config_id
    # @return [String, nil]
    attr_accessor :name
    # @return [String, nil]
    attr_accessor :start
    # @return [String, nil]
    attr_accessor :prefix
    # @return [String]
    attr_accessor :organization_id
    # @return [String, nil]
    attr_accessor :project_id
    # @return [Boolean]
    attr_accessor :enabled
    # @return [Boolean]
    attr_accessor :rate_limit_enabled
    # @return [Integer, nil]
    attr_accessor :rate_limit_time_window
    # @return [Integer, nil]
    attr_accessor :rate_limit_max
    # @return [Integer]
    attr_accessor :request_count
    # @return [Integer, nil]
    attr_accessor :remaining
    # @return [String, nil]
    attr_accessor :last_request
    # @return [String, nil]
    attr_accessor :expires_at
    # @return [String]
    attr_accessor :created_at
    # @return [String]
    attr_accessor :updated_at
    # @return [Hash{String => String}]
    attr_accessor :metadata
    # @return [Hash{String => Array<String>}]
    attr_accessor :permissions

    # @param id [String], config_id [String], name [String, nil], start [String, nil], prefix [String, nil], organization_id [String], project_id [String, nil], enabled [Boolean], rate_limit_enabled [Boolean], rate_limit_time_window [Integer, nil], rate_limit_max [Integer, nil], request_count [Integer], remaining [Integer, nil], last_request [String, nil], expires_at [String, nil], created_at [String], updated_at [String], metadata [Hash{String => String}], permissions [Hash{String => Array<String>}]
    def initialize(id: , config_id: , name: , start: , prefix: , organization_id: , project_id: , enabled: , rate_limit_enabled: , rate_limit_time_window: , rate_limit_max: , request_count: , remaining: , last_request: , expires_at: , created_at: , updated_at: , metadata: , permissions: )
      @id = id
      @config_id = config_id
      @name = name
      @start = start
      @prefix = prefix
      @organization_id = organization_id
      @project_id = project_id
      @enabled = enabled
      @rate_limit_enabled = rate_limit_enabled
      @rate_limit_time_window = rate_limit_time_window
      @rate_limit_max = rate_limit_max
      @request_count = request_count
      @remaining = remaining
      @last_request = last_request
      @expires_at = expires_at
      @created_at = created_at
      @updated_at = updated_at
      @metadata = metadata
      @permissions = permissions
    end

    # @return [Hash] a hash representation of this object
    def to_h
      {
        id: @id,
        config_id: @config_id,
        name: @name,
        start: @start,
        prefix: @prefix,
        organization_id: @organization_id,
        project_id: @project_id,
        enabled: @enabled,
        rate_limit_enabled: @rate_limit_enabled,
        rate_limit_time_window: @rate_limit_time_window,
        rate_limit_max: @rate_limit_max,
        request_count: @request_count,
        remaining: @remaining,
        last_request: @last_request,
        expires_at: @expires_at,
        created_at: @created_at,
        updated_at: @updated_at,
        metadata: @metadata,
        permissions: @permissions,
      }.compact
    end

    # Create an instance from a parsed JSON hash.
    # @param attributes [Hash]
    # @return [ApiKey]
    def self.from_json(attributes)
      return nil unless attributes.is_a?(Hash)

      new(
        id: attributes.key?("id") ? attributes["id"] : attributes[:id],
        config_id: attributes.key?("configId") ? attributes["configId"] : attributes[:config_id],
        name: attributes.key?("name") ? attributes["name"] : attributes[:name],
        start: attributes.key?("start") ? attributes["start"] : attributes[:start],
        prefix: attributes.key?("prefix") ? attributes["prefix"] : attributes[:prefix],
        organization_id: attributes.key?("organizationId") ? attributes["organizationId"] : attributes[:organization_id],
        project_id: attributes.key?("projectId") ? attributes["projectId"] : attributes[:project_id],
        enabled: attributes.key?("enabled") ? attributes["enabled"] : attributes[:enabled],
        rate_limit_enabled: attributes.key?("rateLimitEnabled") ? attributes["rateLimitEnabled"] : attributes[:rate_limit_enabled],
        rate_limit_time_window: attributes.key?("rateLimitTimeWindow") ? attributes["rateLimitTimeWindow"] : attributes[:rate_limit_time_window],
        rate_limit_max: attributes.key?("rateLimitMax") ? attributes["rateLimitMax"] : attributes[:rate_limit_max],
        request_count: attributes.key?("requestCount") ? attributes["requestCount"] : attributes[:request_count],
        remaining: attributes.key?("remaining") ? attributes["remaining"] : attributes[:remaining],
        last_request: attributes.key?("lastRequest") ? attributes["lastRequest"] : attributes[:last_request],
        expires_at: attributes.key?("expiresAt") ? attributes["expiresAt"] : attributes[:expires_at],
        created_at: attributes.key?("createdAt") ? attributes["createdAt"] : attributes[:created_at],
        updated_at: attributes.key?("updatedAt") ? attributes["updatedAt"] : attributes[:updated_at],
        metadata: attributes.key?("metadata") ? attributes["metadata"] : attributes[:metadata],
        permissions: attributes.key?("permissions") ? attributes["permissions"] : attributes[:permissions],
      )
    end
  end

  # Schema type: ApiKeyUsageRecord
  class ApiKeyUsageRecord
    # @return [String]
    attr_accessor :id
    # @return [String]
    attr_accessor :key_id
    # @return [String]
    attr_accessor :org_id
    # @return [String]
    attr_accessor :method
    # @return [String]
    attr_accessor :route
    # @return [Integer]
    attr_accessor :status_code
    # @return [Integer, nil]
    attr_accessor :duration_ms
    # @return [String, nil]
    attr_accessor :ip
    # @return [String]
    attr_accessor :ts

    # @param id [String], key_id [String], org_id [String], method [String], route [String], status_code [Integer], duration_ms [Integer, nil], ip [String, nil], ts [String]
    def initialize(id: , key_id: , org_id: , method: , route: , status_code: , duration_ms: , ip: , ts: )
      @id = id
      @key_id = key_id
      @org_id = org_id
      @method = method
      @route = route
      @status_code = status_code
      @duration_ms = duration_ms
      @ip = ip
      @ts = ts
    end

    # @return [Hash] a hash representation of this object
    def to_h
      {
        id: @id,
        key_id: @key_id,
        org_id: @org_id,
        method: @method,
        route: @route,
        status_code: @status_code,
        duration_ms: @duration_ms,
        ip: @ip,
        ts: @ts,
      }.compact
    end

    # Create an instance from a parsed JSON hash.
    # @param attributes [Hash]
    # @return [ApiKeyUsageRecord]
    def self.from_json(attributes)
      return nil unless attributes.is_a?(Hash)

      new(
        id: attributes.key?("id") ? attributes["id"] : attributes[:id],
        key_id: attributes.key?("keyId") ? attributes["keyId"] : attributes[:key_id],
        org_id: attributes.key?("orgId") ? attributes["orgId"] : attributes[:org_id],
        method: attributes.key?("method") ? attributes["method"] : attributes[:method],
        route: attributes.key?("route") ? attributes["route"] : attributes[:route],
        status_code: attributes.key?("statusCode") ? attributes["statusCode"] : attributes[:status_code],
        duration_ms: attributes.key?("durationMs") ? attributes["durationMs"] : attributes[:duration_ms],
        ip: attributes.key?("ip") ? attributes["ip"] : attributes[:ip],
        ts: attributes.key?("ts") ? attributes["ts"] : attributes[:ts],
      )
    end
  end

  # Schema type: UsagePage
  class UsagePage
    # @return [Integer]
    attr_accessor :size
    # @return [Integer]
    attr_accessor :total_pages
    # @return [Boolean]
    attr_accessor :has_more

    # @param size [Integer], total_pages [Integer], has_more [Boolean]
    def initialize(size: , total_pages: , has_more: )
      @size = size
      @total_pages = total_pages
      @has_more = has_more
    end

    # @return [Hash] a hash representation of this object
    def to_h
      {
        size: @size,
        total_pages: @total_pages,
        has_more: @has_more,
      }.compact
    end

    # Create an instance from a parsed JSON hash.
    # @param attributes [Hash]
    # @return [UsagePage]
    def self.from_json(attributes)
      return nil unless attributes.is_a?(Hash)

      new(
        size: attributes.key?("size") ? attributes["size"] : attributes[:size],
        total_pages: attributes.key?("totalPages") ? attributes["totalPages"] : attributes[:total_pages],
        has_more: attributes.key?("hasMore") ? attributes["hasMore"] : attributes[:has_more],
      )
    end
  end

  # Schema type: ApiKeyUsageResponse
  class ApiKeyUsageResponse
    # @return [Array<ApiKeyUsageRecord>]
    attr_accessor :data
    # @return [UsagePage]
    attr_accessor :page

    # @param data [Array<ApiKeyUsageRecord>], page [UsagePage]
    def initialize(data: , page: )
      @data = data
      @page = page
    end

    # @return [Hash] a hash representation of this object
    def to_h
      {
        data: @data,
        page: @page,
      }.compact
    end

    # Create an instance from a parsed JSON hash.
    # @param attributes [Hash]
    # @return [ApiKeyUsageResponse]
    def self.from_json(attributes)
      return nil unless attributes.is_a?(Hash)

      new(
        data: attributes.key?("data") ? attributes["data"] : attributes[:data],
        page: attributes.key?("page") ? attributes["page"] : attributes[:page],
      )
    end
  end

  # Schema type: ProjectLimitsModel
  class ProjectLimitsModel
    # @return [Integer]
    attr_accessor :daily_sends
    # @return [Integer]
    attr_accessor :per_second_sends
    # @return [Integer]
    attr_accessor :max_recipients_per_message
    # @return [Integer]
    attr_accessor :max_domains
    # @return [Integer]
    attr_accessor :max_api_keys
    # @return [Integer]
    attr_accessor :max_webhooks

    # @param daily_sends [Integer], per_second_sends [Integer], max_recipients_per_message [Integer], max_domains [Integer], max_api_keys [Integer], max_webhooks [Integer]
    def initialize(daily_sends: , per_second_sends: , max_recipients_per_message: , max_domains: , max_api_keys: , max_webhooks: )
      @daily_sends = daily_sends
      @per_second_sends = per_second_sends
      @max_recipients_per_message = max_recipients_per_message
      @max_domains = max_domains
      @max_api_keys = max_api_keys
      @max_webhooks = max_webhooks
    end

    # @return [Hash] a hash representation of this object
    def to_h
      {
        daily_sends: @daily_sends,
        per_second_sends: @per_second_sends,
        max_recipients_per_message: @max_recipients_per_message,
        max_domains: @max_domains,
        max_api_keys: @max_api_keys,
        max_webhooks: @max_webhooks,
      }.compact
    end

    # Create an instance from a parsed JSON hash.
    # @param attributes [Hash]
    # @return [ProjectLimitsModel]
    def self.from_json(attributes)
      return nil unless attributes.is_a?(Hash)

      new(
        daily_sends: attributes.key?("dailySends") ? attributes["dailySends"] : attributes[:daily_sends],
        per_second_sends: attributes.key?("perSecondSends") ? attributes["perSecondSends"] : attributes[:per_second_sends],
        max_recipients_per_message: attributes.key?("maxRecipientsPerMessage") ? attributes["maxRecipientsPerMessage"] : attributes[:max_recipients_per_message],
        max_domains: attributes.key?("maxDomains") ? attributes["maxDomains"] : attributes[:max_domains],
        max_api_keys: attributes.key?("maxApiKeys") ? attributes["maxApiKeys"] : attributes[:max_api_keys],
        max_webhooks: attributes.key?("maxWebhooks") ? attributes["maxWebhooks"] : attributes[:max_webhooks],
      )
    end
  end

  # Schema type: ProjectTrackingSettingsModel
  class ProjectTrackingSettingsModel
    # @return [Boolean]
    attr_accessor :open_tracking
    # @return [Boolean]
    attr_accessor :click_tracking
    # @return [Boolean]
    attr_accessor :unsubscribe_tracking
    # @return [Boolean]
    attr_accessor :read_engagement
    # @return [Boolean]
    attr_accessor :scroll_depth

    # @param open_tracking [Boolean], click_tracking [Boolean], unsubscribe_tracking [Boolean], read_engagement [Boolean], scroll_depth [Boolean]
    def initialize(open_tracking: , click_tracking: , unsubscribe_tracking: , read_engagement: , scroll_depth: nil)
      @open_tracking = open_tracking
      @click_tracking = click_tracking
      @unsubscribe_tracking = unsubscribe_tracking
      @read_engagement = read_engagement
      @scroll_depth = scroll_depth
    end

    # @return [Hash] a hash representation of this object
    def to_h
      {
        open_tracking: @open_tracking,
        click_tracking: @click_tracking,
        unsubscribe_tracking: @unsubscribe_tracking,
        read_engagement: @read_engagement,
        scroll_depth: @scroll_depth,
      }.compact
    end

    # Create an instance from a parsed JSON hash.
    # @param attributes [Hash]
    # @return [ProjectTrackingSettingsModel]
    def self.from_json(attributes)
      return nil unless attributes.is_a?(Hash)

      new(
        open_tracking: attributes.key?("openTracking") ? attributes["openTracking"] : attributes[:open_tracking],
        click_tracking: attributes.key?("clickTracking") ? attributes["clickTracking"] : attributes[:click_tracking],
        unsubscribe_tracking: attributes.key?("unsubscribeTracking") ? attributes["unsubscribeTracking"] : attributes[:unsubscribe_tracking],
        read_engagement: attributes.key?("readEngagement") ? attributes["readEngagement"] : attributes[:read_engagement],
        scroll_depth: attributes.key?("scrollDepth") ? attributes["scrollDepth"] : attributes[:scroll_depth],
      )
    end
  end

  # Schema type: ProjectResponse
  class ProjectResponse
    # @return [String]
    attr_accessor :id
    # @return [String]
    attr_accessor :name
    # @return [String]
    attr_accessor :slug
    # @return [String]
    attr_accessor :status
    # @return [String, nil]
    attr_accessor :suspension_reason
    # @return [String]
    attr_accessor :region
    # @return [ProjectLimitsModel]
    attr_accessor :limits
    # @return [ProjectTrackingSettingsModel]
    attr_accessor :tracking_settings
    # @return [String]
    attr_accessor :created_at
    # @return [String]
    attr_accessor :updated_at

    # @param id [String], name [String], slug [String], status [String], suspension_reason [String, nil], region [String], limits [ProjectLimitsModel], tracking_settings [ProjectTrackingSettingsModel], created_at [String], updated_at [String]
    def initialize(id: , name: , slug: , status: , suspension_reason: , region: , limits: , tracking_settings: , created_at: , updated_at: )
      @id = id
      @name = name
      @slug = slug
      @status = status
      @suspension_reason = suspension_reason
      @region = region
      @limits = limits
      @tracking_settings = tracking_settings
      @created_at = created_at
      @updated_at = updated_at
    end

    # @return [Hash] a hash representation of this object
    def to_h
      {
        id: @id,
        name: @name,
        slug: @slug,
        status: @status,
        suspension_reason: @suspension_reason,
        region: @region,
        limits: @limits,
        tracking_settings: @tracking_settings,
        created_at: @created_at,
        updated_at: @updated_at,
      }.compact
    end

    # Create an instance from a parsed JSON hash.
    # @param attributes [Hash]
    # @return [ProjectResponse]
    def self.from_json(attributes)
      return nil unless attributes.is_a?(Hash)

      new(
        id: attributes.key?("id") ? attributes["id"] : attributes[:id],
        name: attributes.key?("name") ? attributes["name"] : attributes[:name],
        slug: attributes.key?("slug") ? attributes["slug"] : attributes[:slug],
        status: attributes.key?("status") ? attributes["status"] : attributes[:status],
        suspension_reason: attributes.key?("suspensionReason") ? attributes["suspensionReason"] : attributes[:suspension_reason],
        region: attributes.key?("region") ? attributes["region"] : attributes[:region],
        limits: attributes.key?("limits") ? attributes["limits"] : attributes[:limits],
        tracking_settings: attributes.key?("trackingSettings") ? attributes["trackingSettings"] : attributes[:tracking_settings],
        created_at: attributes.key?("createdAt") ? attributes["createdAt"] : attributes[:created_at],
        updated_at: attributes.key?("updatedAt") ? attributes["updatedAt"] : attributes[:updated_at],
      )
    end
  end

  # Schema type: ProjectPageResponse
  class ProjectPageResponse
    # @return [Array<ProjectResponse>]
    attr_accessor :data
    # @return [PageInfo]
    attr_accessor :page

    # @param data [Array<ProjectResponse>], page [PageInfo]
    def initialize(data: , page: )
      @data = data
      @page = page
    end

    # @return [Hash] a hash representation of this object
    def to_h
      {
        data: @data,
        page: @page,
      }.compact
    end

    # Create an instance from a parsed JSON hash.
    # @param attributes [Hash]
    # @return [ProjectPageResponse]
    def self.from_json(attributes)
      return nil unless attributes.is_a?(Hash)

      new(
        data: attributes.key?("data") ? attributes["data"] : attributes[:data],
        page: attributes.key?("page") ? attributes["page"] : attributes[:page],
      )
    end
  end

  # Schema type: UpdateProjectRequest
  class UpdateProjectRequest
    # @return [String, nil]
    attr_accessor :name
    # @return [String, nil]
    attr_accessor :slug
    # @return [ProjectLimitsModel, nil]
    attr_accessor :limits
    # @return [ProjectTrackingSettingsModel, nil]
    attr_accessor :tracking_settings

    # @param name [String, nil], slug [String, nil], limits [ProjectLimitsModel, nil], tracking_settings [ProjectTrackingSettingsModel, nil]
    def initialize(name: nil, slug: nil, limits: nil, tracking_settings: nil)
      @name = name
      @slug = slug
      @limits = limits
      @tracking_settings = tracking_settings
    end

    # @return [Hash] a hash representation of this object
    def to_h
      {
        name: @name,
        slug: @slug,
        limits: @limits,
        tracking_settings: @tracking_settings,
      }.compact
    end

    # Create an instance from a parsed JSON hash.
    # @param attributes [Hash]
    # @return [UpdateProjectRequest]
    def self.from_json(attributes)
      return nil unless attributes.is_a?(Hash)

      new(
        name: attributes.key?("name") ? attributes["name"] : attributes[:name],
        slug: attributes.key?("slug") ? attributes["slug"] : attributes[:slug],
        limits: attributes.key?("limits") ? attributes["limits"] : attributes[:limits],
        tracking_settings: attributes.key?("trackingSettings") ? attributes["trackingSettings"] : attributes[:tracking_settings],
      )
    end
  end

  # Schema type: EmailPageResponse
  class EmailPageResponse
    # @return [Array<EmailDetailResponse>]
    attr_accessor :data
    # @return [PageInfo]
    attr_accessor :page

    # @param data [Array<EmailDetailResponse>], page [PageInfo]
    def initialize(data: , page: )
      @data = data
      @page = page
    end

    # @return [Hash] a hash representation of this object
    def to_h
      {
        data: @data,
        page: @page,
      }.compact
    end

    # Create an instance from a parsed JSON hash.
    # @param attributes [Hash]
    # @return [EmailPageResponse]
    def self.from_json(attributes)
      return nil unless attributes.is_a?(Hash)

      new(
        data: attributes.key?("data") ? attributes["data"] : attributes[:data],
        page: attributes.key?("page") ? attributes["page"] : attributes[:page],
      )
    end
  end

  # Schema type: EmailTimelineItem
  class EmailTimelineItem
    # @return [String]
    attr_accessor :id
    # @return [String]
    attr_accessor :type
    # @return [String, nil]
    attr_accessor :provider_event_id
    # @return [Hash{String => String, nil}]
    attr_accessor :payload
    # @return [String]
    attr_accessor :occurred_at
    # @return [String]
    attr_accessor :created_at

    # @param id [String], type [String], provider_event_id [String, nil], payload [Hash{String => String, nil}], occurred_at [String], created_at [String]
    def initialize(id: , type: , provider_event_id: , payload: , occurred_at: , created_at: )
      @id = id
      @type = type
      @provider_event_id = provider_event_id
      @payload = payload
      @occurred_at = occurred_at
      @created_at = created_at
    end

    # @return [Hash] a hash representation of this object
    def to_h
      {
        id: @id,
        type: @type,
        provider_event_id: @provider_event_id,
        payload: @payload,
        occurred_at: @occurred_at,
        created_at: @created_at,
      }.compact
    end

    # Create an instance from a parsed JSON hash.
    # @param attributes [Hash]
    # @return [EmailTimelineItem]
    def self.from_json(attributes)
      return nil unless attributes.is_a?(Hash)

      new(
        id: attributes.key?("id") ? attributes["id"] : attributes[:id],
        type: attributes.key?("type") ? attributes["type"] : attributes[:type],
        provider_event_id: attributes.key?("providerEventId") ? attributes["providerEventId"] : attributes[:provider_event_id],
        payload: attributes.key?("payload") ? attributes["payload"] : attributes[:payload],
        occurred_at: attributes.key?("occurredAt") ? attributes["occurredAt"] : attributes[:occurred_at],
        created_at: attributes.key?("createdAt") ? attributes["createdAt"] : attributes[:created_at],
      )
    end
  end

  # Schema type: EmailTimelineResponse
  class EmailTimelineResponse
    # @return [Array<EmailTimelineItem>]
    attr_accessor :items

    # @param items [Array<EmailTimelineItem>]
    def initialize(items: )
      @items = items
    end

    # @return [Hash] a hash representation of this object
    def to_h
      {
        items: @items,
      }.compact
    end

    # Create an instance from a parsed JSON hash.
    # @param attributes [Hash]
    # @return [EmailTimelineResponse]
    def self.from_json(attributes)
      return nil unless attributes.is_a?(Hash)

      new(
        items: attributes.key?("items") ? attributes["items"] : attributes[:items],
      )
    end
  end

  # Schema type: DomainListItemResponse
  class DomainListItemResponse
    # @return [String]
    attr_accessor :id
    # @return [String]
    attr_accessor :domain
    # @return [String]
    attr_accessor :region
    # @return [String]
    attr_accessor :status
    # @return [String]
    attr_accessor :dkim_status
    # @return [String]
    attr_accessor :bimi_status
    # @return [String]
    attr_accessor :tracking_status
    # @return [String]
    attr_accessor :updated_at

    # @param id [String], domain [String], region [String], status [String], dkim_status [String], bimi_status [String], tracking_status [String], updated_at [String]
    def initialize(id: , domain: , region: , status: , dkim_status: , bimi_status: , tracking_status: , updated_at: )
      @id = id
      @domain = domain
      @region = region
      @status = status
      @dkim_status = dkim_status
      @bimi_status = bimi_status
      @tracking_status = tracking_status
      @updated_at = updated_at
    end

    # @return [Hash] a hash representation of this object
    def to_h
      {
        id: @id,
        domain: @domain,
        region: @region,
        status: @status,
        dkim_status: @dkim_status,
        bimi_status: @bimi_status,
        tracking_status: @tracking_status,
        updated_at: @updated_at,
      }.compact
    end

    # Create an instance from a parsed JSON hash.
    # @param attributes [Hash]
    # @return [DomainListItemResponse]
    def self.from_json(attributes)
      return nil unless attributes.is_a?(Hash)

      new(
        id: attributes.key?("id") ? attributes["id"] : attributes[:id],
        domain: attributes.key?("domain") ? attributes["domain"] : attributes[:domain],
        region: attributes.key?("region") ? attributes["region"] : attributes[:region],
        status: attributes.key?("status") ? attributes["status"] : attributes[:status],
        dkim_status: attributes.key?("dkimStatus") ? attributes["dkimStatus"] : attributes[:dkim_status],
        bimi_status: attributes.key?("bimiStatus") ? attributes["bimiStatus"] : attributes[:bimi_status],
        tracking_status: attributes.key?("trackingStatus") ? attributes["trackingStatus"] : attributes[:tracking_status],
        updated_at: attributes.key?("updatedAt") ? attributes["updatedAt"] : attributes[:updated_at],
      )
    end
  end

  # Schema type: DomainListPageResponse
  class DomainListPageResponse
    # @return [Array<DomainListItemResponse>]
    attr_accessor :data
    # @return [PageInfo]
    attr_accessor :page

    # @param data [Array<DomainListItemResponse>], page [PageInfo]
    def initialize(data: , page: )
      @data = data
      @page = page
    end

    # @return [Hash] a hash representation of this object
    def to_h
      {
        data: @data,
        page: @page,
      }.compact
    end

    # Create an instance from a parsed JSON hash.
    # @param attributes [Hash]
    # @return [DomainListPageResponse]
    def self.from_json(attributes)
      return nil unless attributes.is_a?(Hash)

      new(
        data: attributes.key?("data") ? attributes["data"] : attributes[:data],
        page: attributes.key?("page") ? attributes["page"] : attributes[:page],
      )
    end
  end

  # Schema type: DkimRecordResponse
  class DkimRecordResponse
    # @return [String]
    attr_accessor :name
    # @return [String]
    attr_accessor :type
    # @return [String]
    attr_accessor :value
    # @return [String, nil]
    attr_accessor :status

    # @param name [String], type [String], value [String], status [String, nil]
    def initialize(name: , type: , value: , status: nil)
      @name = name
      @type = type
      @value = value
      @status = status
    end

    # @return [Hash] a hash representation of this object
    def to_h
      {
        name: @name,
        type: @type,
        value: @value,
        status: @status,
      }.compact
    end

    # Create an instance from a parsed JSON hash.
    # @param attributes [Hash]
    # @return [DkimRecordResponse]
    def self.from_json(attributes)
      return nil unless attributes.is_a?(Hash)

      new(
        name: attributes.key?("name") ? attributes["name"] : attributes[:name],
        type: attributes.key?("type") ? attributes["type"] : attributes[:type],
        value: attributes.key?("value") ? attributes["value"] : attributes[:value],
        status: attributes.key?("status") ? attributes["status"] : attributes[:status],
      )
    end
  end

  # Schema type: DnsRecordResponse
  class DnsRecordResponse
    # @return [String]
    attr_accessor :name
    # @return [String]
    attr_accessor :type
    # @return [String]
    attr_accessor :value
    # @return [Integer, nil]
    attr_accessor :priority
    # @return [Boolean, nil]
    attr_accessor :optional
    # @return [String, nil]
    attr_accessor :status

    # @param name [String], type [String], value [String], priority [Integer, nil], optional [Boolean, nil], status [String, nil]
    def initialize(name: , type: , value: , priority: nil, optional: nil, status: nil)
      @name = name
      @type = type
      @value = value
      @priority = priority
      @optional = optional
      @status = status
    end

    # @return [Hash] a hash representation of this object
    def to_h
      {
        name: @name,
        type: @type,
        value: @value,
        priority: @priority,
        optional: @optional,
        status: @status,
      }.compact
    end

    # Create an instance from a parsed JSON hash.
    # @param attributes [Hash]
    # @return [DnsRecordResponse]
    def self.from_json(attributes)
      return nil unless attributes.is_a?(Hash)

      new(
        name: attributes.key?("name") ? attributes["name"] : attributes[:name],
        type: attributes.key?("type") ? attributes["type"] : attributes[:type],
        value: attributes.key?("value") ? attributes["value"] : attributes[:value],
        priority: attributes.key?("priority") ? attributes["priority"] : attributes[:priority],
        optional: attributes.key?("optional") ? attributes["optional"] : attributes[:optional],
        status: attributes.key?("status") ? attributes["status"] : attributes[:status],
      )
    end
  end

  # Schema type: VerificationRecordsResponse
  class VerificationRecordsResponse
    # @return [Array<DkimRecordResponse>]
    attr_accessor :dkim
    # @return [DnsRecordResponse]
    attr_accessor :mail_from_mx
    # @return [DnsRecordResponse]
    attr_accessor :mail_from_spf
    # @return [DnsRecordResponse, nil]
    attr_accessor :dmarc_recommended
    # @return [DnsRecordResponse, nil]
    attr_accessor :bimi
    # @return [DnsRecordResponse, nil]
    attr_accessor :tracking_cname

    # @param dkim [Array<DkimRecordResponse>], mail_from_mx [DnsRecordResponse], mail_from_spf [DnsRecordResponse], dmarc_recommended [DnsRecordResponse, nil], bimi [DnsRecordResponse, nil], tracking_cname [DnsRecordResponse, nil]
    def initialize(dkim: , mail_from_mx: , mail_from_spf: , dmarc_recommended: nil, bimi: nil, tracking_cname: nil)
      @dkim = dkim
      @mail_from_mx = mail_from_mx
      @mail_from_spf = mail_from_spf
      @dmarc_recommended = dmarc_recommended
      @bimi = bimi
      @tracking_cname = tracking_cname
    end

    # @return [Hash] a hash representation of this object
    def to_h
      {
        dkim: @dkim,
        mail_from_mx: @mail_from_mx,
        mail_from_spf: @mail_from_spf,
        dmarc_recommended: @dmarc_recommended,
        bimi: @bimi,
        tracking_cname: @tracking_cname,
      }.compact
    end

    # Create an instance from a parsed JSON hash.
    # @param attributes [Hash]
    # @return [VerificationRecordsResponse]
    def self.from_json(attributes)
      return nil unless attributes.is_a?(Hash)

      new(
        dkim: attributes.key?("dkim") ? attributes["dkim"] : attributes[:dkim],
        mail_from_mx: attributes.key?("mailFromMx") ? attributes["mailFromMx"] : attributes[:mail_from_mx],
        mail_from_spf: attributes.key?("mailFromSpf") ? attributes["mailFromSpf"] : attributes[:mail_from_spf],
        dmarc_recommended: attributes.key?("dmarcRecommended") ? attributes["dmarcRecommended"] : attributes[:dmarc_recommended],
        bimi: attributes.key?("bimi") ? attributes["bimi"] : attributes[:bimi],
        tracking_cname: attributes.key?("trackingCname") ? attributes["trackingCname"] : attributes[:tracking_cname],
      )
    end
  end

  # Schema type: DomainResponse
  class DomainResponse
    # @return [String]
    attr_accessor :id
    # @return [String]
    attr_accessor :project_id
    # @return [String]
    attr_accessor :domain
    # @return [String]
    attr_accessor :region
    # @return [String]
    attr_accessor :status
    # @return [String]
    attr_accessor :dkim_status
    # @return [String]
    attr_accessor :spf_status
    # @return [String]
    attr_accessor :dmarc_status
    # @return [String]
    attr_accessor :mail_from_status
    # @return [String]
    attr_accessor :mail_from_domain
    # @return [VerificationRecordsResponse]
    attr_accessor :verification_records
    # @return [String]
    attr_accessor :bimi_status
    # @return [String, nil]
    attr_accessor :bimi_logo_url
    # @return [String]
    attr_accessor :created_at
    # @return [String]
    attr_accessor :updated_at
    # @return [String, nil]
    attr_accessor :verified_at

    # @param id [String], project_id [String], domain [String], region [String], status [String], dkim_status [String], spf_status [String], dmarc_status [String], mail_from_status [String], mail_from_domain [String], verification_records [VerificationRecordsResponse], bimi_status [String], bimi_logo_url [String, nil], created_at [String], updated_at [String], verified_at [String, nil]
    def initialize(id: , project_id: , domain: , region: , status: , dkim_status: , spf_status: , dmarc_status: , mail_from_status: , mail_from_domain: , verification_records: , bimi_status: , bimi_logo_url: , created_at: , updated_at: , verified_at: )
      @id = id
      @project_id = project_id
      @domain = domain
      @region = region
      @status = status
      @dkim_status = dkim_status
      @spf_status = spf_status
      @dmarc_status = dmarc_status
      @mail_from_status = mail_from_status
      @mail_from_domain = mail_from_domain
      @verification_records = verification_records
      @bimi_status = bimi_status
      @bimi_logo_url = bimi_logo_url
      @created_at = created_at
      @updated_at = updated_at
      @verified_at = verified_at
    end

    # @return [Hash] a hash representation of this object
    def to_h
      {
        id: @id,
        project_id: @project_id,
        domain: @domain,
        region: @region,
        status: @status,
        dkim_status: @dkim_status,
        spf_status: @spf_status,
        dmarc_status: @dmarc_status,
        mail_from_status: @mail_from_status,
        mail_from_domain: @mail_from_domain,
        verification_records: @verification_records,
        bimi_status: @bimi_status,
        bimi_logo_url: @bimi_logo_url,
        created_at: @created_at,
        updated_at: @updated_at,
        verified_at: @verified_at,
      }.compact
    end

    # Create an instance from a parsed JSON hash.
    # @param attributes [Hash]
    # @return [DomainResponse]
    def self.from_json(attributes)
      return nil unless attributes.is_a?(Hash)

      new(
        id: attributes.key?("id") ? attributes["id"] : attributes[:id],
        project_id: attributes.key?("projectId") ? attributes["projectId"] : attributes[:project_id],
        domain: attributes.key?("domain") ? attributes["domain"] : attributes[:domain],
        region: attributes.key?("region") ? attributes["region"] : attributes[:region],
        status: attributes.key?("status") ? attributes["status"] : attributes[:status],
        dkim_status: attributes.key?("dkimStatus") ? attributes["dkimStatus"] : attributes[:dkim_status],
        spf_status: attributes.key?("spfStatus") ? attributes["spfStatus"] : attributes[:spf_status],
        dmarc_status: attributes.key?("dmarcStatus") ? attributes["dmarcStatus"] : attributes[:dmarc_status],
        mail_from_status: attributes.key?("mailFromStatus") ? attributes["mailFromStatus"] : attributes[:mail_from_status],
        mail_from_domain: attributes.key?("mailFromDomain") ? attributes["mailFromDomain"] : attributes[:mail_from_domain],
        verification_records: attributes.key?("verificationRecords") ? attributes["verificationRecords"] : attributes[:verification_records],
        bimi_status: attributes.key?("bimiStatus") ? attributes["bimiStatus"] : attributes[:bimi_status],
        bimi_logo_url: attributes.key?("bimiLogoUrl") ? attributes["bimiLogoUrl"] : attributes[:bimi_logo_url],
        created_at: attributes.key?("createdAt") ? attributes["createdAt"] : attributes[:created_at],
        updated_at: attributes.key?("updatedAt") ? attributes["updatedAt"] : attributes[:updated_at],
        verified_at: attributes.key?("verifiedAt") ? attributes["verifiedAt"] : attributes[:verified_at],
      )
    end
  end

  # Schema type: RegisterDomainRequest
  class RegisterDomainRequest
    # @return [String]
    attr_accessor :domain
    # @return [String]
    attr_accessor :region

    # @param domain [String], region [String]
    def initialize(domain: , region: )
      @domain = domain
      @region = region
    end

    # @return [Hash] a hash representation of this object
    def to_h
      {
        domain: @domain,
        region: @region,
      }.compact
    end

    # Create an instance from a parsed JSON hash.
    # @param attributes [Hash]
    # @return [RegisterDomainRequest]
    def self.from_json(attributes)
      return nil unless attributes.is_a?(Hash)

      new(
        domain: attributes.key?("domain") ? attributes["domain"] : attributes[:domain],
        region: attributes.key?("region") ? attributes["region"] : attributes[:region],
      )
    end
  end

  # Schema type: UpdateBimiRequest
  class UpdateBimiRequest
    # @return [String, nil]
    attr_accessor :logo_url

    # @param logo_url [String, nil]
    def initialize(logo_url: nil)
      @logo_url = logo_url
    end

    # @return [Hash] a hash representation of this object
    def to_h
      {
        logo_url: @logo_url,
      }.compact
    end

    # Create an instance from a parsed JSON hash.
    # @param attributes [Hash]
    # @return [UpdateBimiRequest]
    def self.from_json(attributes)
      return nil unless attributes.is_a?(Hash)

      new(
        logo_url: attributes.key?("logoUrl") ? attributes["logoUrl"] : attributes[:logo_url],
      )
    end
  end

  # Enum for EmailValidationStatusInput values.
  module EmailValidationStatusInput
    VALID = "valid"
    RISKY = "risky"
    INVALID = "invalid"
    UNKNOWN = "unknown"

    # All valid enum values.
    # @return [Array]
    ALL = [
      VALID,
      RISKY,
      INVALID,
      UNKNOWN,
    ].freeze

    # Check if a value is valid for this enum.
    # @param value [String, Integer]
    # @return [Boolean]
    def self.valid?(value)
      ALL.include?(value)
    end
  end

  # Schema type: GetTopicPerformanceQuery
  class GetTopicPerformanceQuery
    # @return [String] Time window.
    attr_accessor :window
    # @return [String] Required for session auth; ignored for API key auth.
    attr_accessor :project_id

    # @param window [String], project_id [String]
    def initialize(window: nil, project_id: nil)
      @window = window
      @project_id = project_id
    end

    # @return [Hash] a hash representation of this object
    def to_h
      {
        window: @window,
        project_id: @project_id,
      }.compact
    end

    # Create an instance from a parsed JSON hash.
    # @param attributes [Hash]
    # @return [GetTopicPerformanceQuery]
    def self.from_json(attributes)
      return nil unless attributes.is_a?(Hash)

      new(
        window: attributes.key?("window") ? attributes["window"] : attributes[:window],
        project_id: attributes.key?("projectId") ? attributes["projectId"] : attributes[:project_id],
      )
    end
  end

  # Schema type: GetProjectMetricsSummaryQuery
  class GetProjectMetricsSummaryQuery
    # @return [String] Metrics time window.
    attr_accessor :window
    # @return [String] Required for session auth; ignored for API key auth.
    attr_accessor :project_id

    # @param window [String], project_id [String]
    def initialize(window: nil, project_id: nil)
      @window = window
      @project_id = project_id
    end

    # @return [Hash] a hash representation of this object
    def to_h
      {
        window: @window,
        project_id: @project_id,
      }.compact
    end

    # Create an instance from a parsed JSON hash.
    # @param attributes [Hash]
    # @return [GetProjectMetricsSummaryQuery]
    def self.from_json(attributes)
      return nil unless attributes.is_a?(Hash)

      new(
        window: attributes.key?("window") ? attributes["window"] : attributes[:window],
        project_id: attributes.key?("projectId") ? attributes["projectId"] : attributes[:project_id],
      )
    end
  end

  # Schema type: GetProjectMetricsTimelineQuery
  class GetProjectMetricsTimelineQuery
    # @return [String] Metrics time window.
    attr_accessor :window
    # @return [String] `hour` or `day`.
    attr_accessor :granularity
    # @return [String] `compact` or `detailed`.
    attr_accessor :format
    # @return [String] Required for session auth; ignored for API key auth.
    attr_accessor :project_id

    # @param window [String], granularity [String], format [String], project_id [String]
    def initialize(window: nil, granularity: nil, format: nil, project_id: nil)
      @window = window
      @granularity = granularity
      @format = format
      @project_id = project_id
    end

    # @return [Hash] a hash representation of this object
    def to_h
      {
        window: @window,
        granularity: @granularity,
        format: @format,
        project_id: @project_id,
      }.compact
    end

    # Create an instance from a parsed JSON hash.
    # @param attributes [Hash]
    # @return [GetProjectMetricsTimelineQuery]
    def self.from_json(attributes)
      return nil unless attributes.is_a?(Hash)

      new(
        window: attributes.key?("window") ? attributes["window"] : attributes[:window],
        granularity: attributes.key?("granularity") ? attributes["granularity"] : attributes[:granularity],
        format: attributes.key?("format") ? attributes["format"] : attributes[:format],
        project_id: attributes.key?("projectId") ? attributes["projectId"] : attributes[:project_id],
      )
    end
  end

  # Schema type: GetMetricsAdvisorQuery
  class GetMetricsAdvisorQuery
    # @return [String] Required for session auth; ignored for API key auth.
    attr_accessor :project_id

    # @param project_id [String]
    def initialize(project_id: nil)
      @project_id = project_id
    end

    # @return [Hash] a hash representation of this object
    def to_h
      {
        project_id: @project_id,
      }.compact
    end

    # Create an instance from a parsed JSON hash.
    # @param attributes [Hash]
    # @return [GetMetricsAdvisorQuery]
    def self.from_json(attributes)
      return nil unless attributes.is_a?(Hash)

      new(
        project_id: attributes.key?("projectId") ? attributes["projectId"] : attributes[:project_id],
      )
    end
  end

  # ListContactSegmentsResponse — type alias for Array<String>
  ListContactSegmentsResponse = Array

  # GetContactTopicsResponse — type alias for Array<TopicSubscriptionResponse>
  GetContactTopicsResponse = Array

  # GetContactActivityResponse — type alias for Array<ActivityResponse>
  GetContactActivityResponse = Array

  # Schema type without properties: ListApiKeysResponse
  class ListApiKeysResponse
    # @return [Hash] raw attributes
    attr_reader :attributes

    # @param attributes [Hash]
    def initialize(attributes = {})
      @attributes = attributes
    end

    # @return [Hash]
    def to_h
      @attributes.dup
    end

    # Create an instance from a parsed JSON hash.
    # @param attributes [Hash]
    # @return [ListApiKeysResponse]
    def self.from_json(attributes)
      return nil unless attributes.is_a?(Hash)

      new(attributes)
    end
  end

end
