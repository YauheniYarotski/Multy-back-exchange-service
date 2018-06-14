// Code generated by protoc-gen-go. DO NOT EDIT.
// source: streamDescription.proto

package server

import proto "github.com/golang/protobuf/proto"
import fmt "fmt"
import math "math"

import (
	context "golang.org/x/net/context"
	grpc "google.golang.org/grpc"
)

// Reference imports to suppress errors if they are not otherwise used.
var _ = proto.Marshal
var _ = fmt.Errorf
var _ = math.Inf

// This is a compile-time assertion to ensure that this generated file
// is compatible with the proto package it is being compiled against.
// A compilation error at this line likely means your copy of the
// proto package needs to be updated.
const _ = proto.ProtoPackageIsVersion2 // please upgrade the proto package

type Tickers struct {
	ExchangeTickers      []*ExchangeTickers `protobuf:"bytes,1,rep,name=exchangeTickers,proto3" json:"exchangeTickers,omitempty"`
	XXX_NoUnkeyedLiteral struct{}           `json:"-"`
	XXX_unrecognized     []byte             `json:"-"`
	XXX_sizecache        int32              `json:"-"`
}

func (m *Tickers) Reset()         { *m = Tickers{} }
func (m *Tickers) String() string { return proto.CompactTextString(m) }
func (*Tickers) ProtoMessage()    {}
func (*Tickers) Descriptor() ([]byte, []int) {
	return fileDescriptor_streamDescription_1e817b5ff5d9d9ae, []int{0}
}
func (m *Tickers) XXX_Unmarshal(b []byte) error {
	return xxx_messageInfo_Tickers.Unmarshal(m, b)
}
func (m *Tickers) XXX_Marshal(b []byte, deterministic bool) ([]byte, error) {
	return xxx_messageInfo_Tickers.Marshal(b, m, deterministic)
}
func (dst *Tickers) XXX_Merge(src proto.Message) {
	xxx_messageInfo_Tickers.Merge(dst, src)
}
func (m *Tickers) XXX_Size() int {
	return xxx_messageInfo_Tickers.Size(m)
}
func (m *Tickers) XXX_DiscardUnknown() {
	xxx_messageInfo_Tickers.DiscardUnknown(m)
}

var xxx_messageInfo_Tickers proto.InternalMessageInfo

func (m *Tickers) GetExchangeTickers() []*ExchangeTickers {
	if m != nil {
		return m.ExchangeTickers
	}
	return nil
}

type ExchangeTickers struct {
	TimpeStamp           int64     `protobuf:"varint,1,opt,name=timpeStamp,proto3" json:"timpeStamp,omitempty"`
	Exchange             string    `protobuf:"bytes,2,opt,name=exchange,proto3" json:"exchange,omitempty"`
	Tickers              []*Ticker `protobuf:"bytes,3,rep,name=tickers,proto3" json:"tickers,omitempty"`
	XXX_NoUnkeyedLiteral struct{}  `json:"-"`
	XXX_unrecognized     []byte    `json:"-"`
	XXX_sizecache        int32     `json:"-"`
}

func (m *ExchangeTickers) Reset()         { *m = ExchangeTickers{} }
func (m *ExchangeTickers) String() string { return proto.CompactTextString(m) }
func (*ExchangeTickers) ProtoMessage()    {}
func (*ExchangeTickers) Descriptor() ([]byte, []int) {
	return fileDescriptor_streamDescription_1e817b5ff5d9d9ae, []int{1}
}
func (m *ExchangeTickers) XXX_Unmarshal(b []byte) error {
	return xxx_messageInfo_ExchangeTickers.Unmarshal(m, b)
}
func (m *ExchangeTickers) XXX_Marshal(b []byte, deterministic bool) ([]byte, error) {
	return xxx_messageInfo_ExchangeTickers.Marshal(b, m, deterministic)
}
func (dst *ExchangeTickers) XXX_Merge(src proto.Message) {
	xxx_messageInfo_ExchangeTickers.Merge(dst, src)
}
func (m *ExchangeTickers) XXX_Size() int {
	return xxx_messageInfo_ExchangeTickers.Size(m)
}
func (m *ExchangeTickers) XXX_DiscardUnknown() {
	xxx_messageInfo_ExchangeTickers.DiscardUnknown(m)
}

var xxx_messageInfo_ExchangeTickers proto.InternalMessageInfo

func (m *ExchangeTickers) GetTimpeStamp() int64 {
	if m != nil {
		return m.TimpeStamp
	}
	return 0
}

func (m *ExchangeTickers) GetExchange() string {
	if m != nil {
		return m.Exchange
	}
	return ""
}

func (m *ExchangeTickers) GetTickers() []*Ticker {
	if m != nil {
		return m.Tickers
	}
	return nil
}

type Ticker struct {
	Symbol               string   `protobuf:"bytes,1,opt,name=symbol,proto3" json:"symbol,omitempty"`
	Rate                 string   `protobuf:"bytes,2,opt,name=rate,proto3" json:"rate,omitempty"`
	Target               string   `protobuf:"bytes,3,opt,name=target,proto3" json:"target,omitempty"`
	Referrence           string   `protobuf:"bytes,4,opt,name=referrence,proto3" json:"referrence,omitempty"`
	XXX_NoUnkeyedLiteral struct{} `json:"-"`
	XXX_unrecognized     []byte   `json:"-"`
	XXX_sizecache        int32    `json:"-"`
}

func (m *Ticker) Reset()         { *m = Ticker{} }
func (m *Ticker) String() string { return proto.CompactTextString(m) }
func (*Ticker) ProtoMessage()    {}
func (*Ticker) Descriptor() ([]byte, []int) {
	return fileDescriptor_streamDescription_1e817b5ff5d9d9ae, []int{2}
}
func (m *Ticker) XXX_Unmarshal(b []byte) error {
	return xxx_messageInfo_Ticker.Unmarshal(m, b)
}
func (m *Ticker) XXX_Marshal(b []byte, deterministic bool) ([]byte, error) {
	return xxx_messageInfo_Ticker.Marshal(b, m, deterministic)
}
func (dst *Ticker) XXX_Merge(src proto.Message) {
	xxx_messageInfo_Ticker.Merge(dst, src)
}
func (m *Ticker) XXX_Size() int {
	return xxx_messageInfo_Ticker.Size(m)
}
func (m *Ticker) XXX_DiscardUnknown() {
	xxx_messageInfo_Ticker.DiscardUnknown(m)
}

var xxx_messageInfo_Ticker proto.InternalMessageInfo

func (m *Ticker) GetSymbol() string {
	if m != nil {
		return m.Symbol
	}
	return ""
}

func (m *Ticker) GetRate() string {
	if m != nil {
		return m.Rate
	}
	return ""
}

func (m *Ticker) GetTarget() string {
	if m != nil {
		return m.Target
	}
	return ""
}

func (m *Ticker) GetReferrence() string {
	if m != nil {
		return m.Referrence
	}
	return ""
}

type Empty struct {
	XXX_NoUnkeyedLiteral struct{} `json:"-"`
	XXX_unrecognized     []byte   `json:"-"`
	XXX_sizecache        int32    `json:"-"`
}

func (m *Empty) Reset()         { *m = Empty{} }
func (m *Empty) String() string { return proto.CompactTextString(m) }
func (*Empty) ProtoMessage()    {}
func (*Empty) Descriptor() ([]byte, []int) {
	return fileDescriptor_streamDescription_1e817b5ff5d9d9ae, []int{3}
}
func (m *Empty) XXX_Unmarshal(b []byte) error {
	return xxx_messageInfo_Empty.Unmarshal(m, b)
}
func (m *Empty) XXX_Marshal(b []byte, deterministic bool) ([]byte, error) {
	return xxx_messageInfo_Empty.Marshal(b, m, deterministic)
}
func (dst *Empty) XXX_Merge(src proto.Message) {
	xxx_messageInfo_Empty.Merge(dst, src)
}
func (m *Empty) XXX_Size() int {
	return xxx_messageInfo_Empty.Size(m)
}
func (m *Empty) XXX_DiscardUnknown() {
	xxx_messageInfo_Empty.DiscardUnknown(m)
}

var xxx_messageInfo_Empty proto.InternalMessageInfo

func init() {
	proto.RegisterType((*Tickers)(nil), "server.Tickers")
	proto.RegisterType((*ExchangeTickers)(nil), "server.ExchangeTickers")
	proto.RegisterType((*Ticker)(nil), "server.Ticker")
	proto.RegisterType((*Empty)(nil), "server.Empty")
}

// Reference imports to suppress errors if they are not otherwise used.
var _ context.Context
var _ grpc.ClientConn

// This is a compile-time assertion to ensure that this generated file
// is compatible with the grpc package it is being compiled against.
const _ = grpc.SupportPackageIsVersion4

// TickerGRPCServerClient is the client API for TickerGRPCServer service.
//
// For semantics around ctx use and closing/ending streaming RPCs, please refer to https://godoc.org/google.golang.org/grpc#ClientConn.NewStream.
type TickerGRPCServerClient interface {
	Tickers(ctx context.Context, in *Empty, opts ...grpc.CallOption) (TickerGRPCServer_TickersClient, error)
}

type tickerGRPCServerClient struct {
	cc *grpc.ClientConn
}

func NewTickerGRPCServerClient(cc *grpc.ClientConn) TickerGRPCServerClient {
	return &tickerGRPCServerClient{cc}
}

func (c *tickerGRPCServerClient) Tickers(ctx context.Context, in *Empty, opts ...grpc.CallOption) (TickerGRPCServer_TickersClient, error) {
	stream, err := c.cc.NewStream(ctx, &_TickerGRPCServer_serviceDesc.Streams[0], "/server.TickerGRPCServer/tickers", opts...)
	if err != nil {
		return nil, err
	}
	x := &tickerGRPCServerTickersClient{stream}
	if err := x.ClientStream.SendMsg(in); err != nil {
		return nil, err
	}
	if err := x.ClientStream.CloseSend(); err != nil {
		return nil, err
	}
	return x, nil
}

type TickerGRPCServer_TickersClient interface {
	Recv() (*Tickers, error)
	grpc.ClientStream
}

type tickerGRPCServerTickersClient struct {
	grpc.ClientStream
}

func (x *tickerGRPCServerTickersClient) Recv() (*Tickers, error) {
	m := new(Tickers)
	if err := x.ClientStream.RecvMsg(m); err != nil {
		return nil, err
	}
	return m, nil
}

// TickerGRPCServerServer is the server API for TickerGRPCServer service.
type TickerGRPCServerServer interface {
	Tickers(*Empty, TickerGRPCServer_TickersServer) error
}

func RegisterTickerGRPCServerServer(s *grpc.Server, srv TickerGRPCServerServer) {
	s.RegisterService(&_TickerGRPCServer_serviceDesc, srv)
}

func _TickerGRPCServer_Tickers_Handler(srv interface{}, stream grpc.ServerStream) error {
	m := new(Empty)
	if err := stream.RecvMsg(m); err != nil {
		return err
	}
	return srv.(TickerGRPCServerServer).Tickers(m, &tickerGRPCServerTickersServer{stream})
}

type TickerGRPCServer_TickersServer interface {
	Send(*Tickers) error
	grpc.ServerStream
}

type tickerGRPCServerTickersServer struct {
	grpc.ServerStream
}

func (x *tickerGRPCServerTickersServer) Send(m *Tickers) error {
	return x.ServerStream.SendMsg(m)
}

var _TickerGRPCServer_serviceDesc = grpc.ServiceDesc{
	ServiceName: "server.TickerGRPCServer",
	HandlerType: (*TickerGRPCServerServer)(nil),
	Methods:     []grpc.MethodDesc{},
	Streams: []grpc.StreamDesc{
		{
			StreamName:    "tickers",
			Handler:       _TickerGRPCServer_Tickers_Handler,
			ServerStreams: true,
		},
	},
	Metadata: "streamDescription.proto",
}

func init() {
	proto.RegisterFile("streamDescription.proto", fileDescriptor_streamDescription_1e817b5ff5d9d9ae)
}

var fileDescriptor_streamDescription_1e817b5ff5d9d9ae = []byte{
	// 262 bytes of a gzipped FileDescriptorProto
	0x1f, 0x8b, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0xff, 0x5c, 0x91, 0xc1, 0x4e, 0x83, 0x40,
	0x10, 0x86, 0x45, 0x2a, 0xd8, 0x31, 0x8a, 0x99, 0x83, 0x25, 0x3d, 0x18, 0xc2, 0x89, 0x8b, 0xc4,
	0xd4, 0x27, 0x68, 0xb4, 0xf1, 0xe2, 0xc1, 0x6c, 0x7d, 0x01, 0x4a, 0xc6, 0x4a, 0x2c, 0xb0, 0x99,
	0x9d, 0xa8, 0x7d, 0x7b, 0xc3, 0x2e, 0x90, 0xb6, 0x37, 0xe6, 0x9f, 0x2f, 0xf3, 0x7f, 0x61, 0x61,
	0x66, 0x84, 0xa9, 0xa8, 0x5f, 0xc8, 0x94, 0x5c, 0x69, 0xa9, 0xda, 0x26, 0xd7, 0xdc, 0x4a, 0x8b,
	0x81, 0x21, 0xfe, 0x21, 0x4e, 0xdf, 0x20, 0xfc, 0xa8, 0xca, 0x6f, 0x62, 0x83, 0x4b, 0x88, 0xe8,
	0xaf, 0xfc, 0x2a, 0x9a, 0x2d, 0xf5, 0x51, 0xec, 0x25, 0x7e, 0x76, 0xb5, 0x98, 0xe5, 0x0e, 0xce,
	0x57, 0xc7, 0x6b, 0x75, 0xca, 0xa7, 0xbf, 0x10, 0x9d, 0x30, 0x78, 0x0f, 0x20, 0x55, 0xad, 0x69,
	0x2d, 0x45, 0xad, 0x63, 0x2f, 0xf1, 0x32, 0x5f, 0x1d, 0x24, 0x38, 0x87, 0xcb, 0xe1, 0x4a, 0x7c,
	0x9e, 0x78, 0xd9, 0x54, 0x8d, 0x33, 0x66, 0x10, 0x4a, 0x6f, 0xe2, 0x5b, 0x93, 0x9b, 0xc1, 0xc4,
	0x5d, 0x57, 0xc3, 0x3a, 0xdd, 0x41, 0xe0, 0x22, 0xbc, 0x83, 0xc0, 0xec, 0xeb, 0x4d, 0xbb, 0xb3,
	0x5d, 0x53, 0xd5, 0x4f, 0x88, 0x30, 0xe1, 0x42, 0x86, 0x0e, 0xfb, 0xdd, 0xb1, 0x52, 0xf0, 0x96,
	0x24, 0xf6, 0x1d, 0xeb, 0xa6, 0xce, 0x99, 0xe9, 0x93, 0x98, 0xa9, 0x29, 0x29, 0x9e, 0xd8, 0xdd,
	0x41, 0x92, 0x86, 0x70, 0xb1, 0xaa, 0xb5, 0xec, 0x17, 0x4b, 0xb8, 0x75, 0xb5, 0xaf, 0xea, 0xfd,
	0x79, 0x6d, 0xd5, 0xf0, 0x61, 0x94, 0xc6, 0xeb, 0xf1, 0xc7, 0x75, 0xf4, 0x3c, 0x3a, 0xb6, 0x37,
	0xe9, 0xd9, 0xa3, 0xb7, 0x09, 0xec, 0x7b, 0x3c, 0xfd, 0x07, 0x00, 0x00, 0xff, 0xff, 0x6c, 0xfc,
	0x44, 0xee, 0xaa, 0x01, 0x00, 0x00,
}
